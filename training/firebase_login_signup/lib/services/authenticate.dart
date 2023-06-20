import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_login_signup/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/user.dart';

class FireStoreUtils {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static Reference storage = FirebaseStorage.instance.ref();

  static Future<User?> getCurrentUser(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> userDocument =
    await firestore.collection(usersCollection).doc(uid).get();
    if (userDocument.data() != null && userDocument.exists) {
      return User.fromJson(userDocument.data()!);
    } else {
      return null;
    }
  }

  static Future<dynamic> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      auth.UserCredential result = await auth.FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await firestore
          .collection(usersCollection)
          .doc(result.user?.uid ?? '')
          .get();
      User? user;
      if (documentSnapshot.exists) {
        user = User.fromJson(documentSnapshot.data() ?? {});
      }
      return user;
    } on auth.FirebaseAuthException catch (exception, s) {
      debugPrint('$exception$s');
      switch ((exception).code) {
        case 'invalid-email':
          return 'Email address is malformed.';
        case 'wrong-password':
          return 'Wrong password.';
        case 'user-not-found':
          return 'No user corresponding to the given email address.';
        case 'user-disabled':
          return 'This user has been disabled.';
        case 'too-many-requests':
          return 'Too many attempts to sign in as this user.';
      }
      return 'Unexpected firebase error, Please try again.';
    } catch (e, s) {
      debugPrint('$e$s');
      return 'Login failed, Please try again.';
    }
  }

  static Future<String?> createNewUser(User user) async => await firestore
      .collection(usersCollection)
      .doc(user.userID)
      .set(user.toJson())
      .then((value) => null, onError: (e) => e);

  static signUpWithEmailAndPassword({
    required String emailAddress,
    required String password,
    fullName = 'Anonymous' ,
  }) async {
    try {
      auth.UserCredential result = await auth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: emailAddress, password: password);

      User user = User(
          email: emailAddress,
          fullName: fullName,
          userID: result.user?.uid ?? '',);
      String? errorMessage = await createNewUser(user);
      if (errorMessage == null) {
        return user;
      } else {
        return 'Couldn\'t sign up for firebase, Please try again.';
      }
    } on auth.FirebaseAuthException catch (error) {
      debugPrint('$error${error.stackTrace}');
      String message = 'Couldn\'t sign up';
      switch (error.code) {
        case 'email-already-in-use':
          message = 'Email already in use, Please pick another email!';
          break;
        case 'invalid-email':
          message = 'Enter valid e-mail';
          break;
        case 'operation-not-allowed':
          message = 'Email/password accounts are not enabled';
          break;
        case 'weak-password':
          message = 'Password must be more than 5 characters';
          break;
        case 'too-many-requests':
          message = 'Too many requests, Please try again later.';
          break;
      }
      return message;
    } catch (e, s) {
      debugPrint('FireStoreUtils.signUpWithEmailAndPasswords $e $s');
      return 'Couldn\'t sign up';
    }
  }

  static logout() async {
    await auth.FirebaseAuth.instance.signOut();
  }

  static Future<User?> getAuthUser() async {
    auth.User? firebaseUser = auth.FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      User? user = await getCurrentUser(firebaseUser.uid);
      return user;
    } else {
      return null;
    }
  }
  static Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

        final auth.OAuthCredential credential =
        auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        auth.UserCredential result = await auth.FirebaseAuth.instance
            .signInWithCredential(credential);
        DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await firestore
            .collection(usersCollection)
            .doc(result.user?.uid ?? '')
            .get();
        User? user;
        if (documentSnapshot.exists) {
          user = User.fromJson(documentSnapshot.data() ?? {});
        } else {
          user = User(
            email: result.user?.email ?? '',
            fullName: result.user?.displayName ?? '',
            userID: result.user?.uid ?? '',
          );
          await createNewUser(user);
        }
        return user;
      } else {
        return 'Google sign in canceled.';
      }
    } catch (error) {
      debugPrint('signInWithGoogle Error: $error');
      return 'Couldn\'t sign in with Google, Please try again.';
    }
  }

  static Future<dynamic> loginOrCreateUserWithPhoneNumberCredential({
    required auth.PhoneAuthCredential credential,
    required String phoneNumber,
    String? fullName = 'Anonymous',
  }) async {
    auth.UserCredential userCredential =
    await auth.FirebaseAuth.instance.signInWithCredential(credential);
    User? user = await getCurrentUser(userCredential.user?.uid ?? '');
    if (user != null) {
      return user;
    } else {
      User user = User(
          fullName: '',
          email: '',
          userID: userCredential.user?.uid ?? '');
      String? errorMessage = await createNewUser(user);
      if (errorMessage == null) {
        return user;
      } else {
        return 'Couldn\'t create new user with phone number.';
      }
    }
  }


  static resetPassword(String emailAddress) async =>
      await auth.FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailAddress);
}

