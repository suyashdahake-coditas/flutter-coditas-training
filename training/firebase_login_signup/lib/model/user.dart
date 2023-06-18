import 'dart:io';

import 'package:flutter/foundation.dart';

class User {
  String email;

  String fullName;

  String userID;

  String appIdentifier;

  User({
    this.email = '',
    this.fullName = '',
    this.userID = '',
  }) : appIdentifier =
            'Flutter Login Screen ${kIsWeb ? 'Web' : Platform.operatingSystem}';

  // String fullName() => '$fullName';

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      email: parsedJson['email'] ?? '',
      fullName: parsedJson['fullName'] ?? '',
      userID: parsedJson['id'] ?? parsedJson['userID'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'fullName': fullName,
      'id': userID,
      'appIdentifier': appIdentifier
    };
  }
}

class MyGlobalVariables {
  static String userId = User().userID;
}

String userId = '';
String email = '';
int phoneNo = 00;
