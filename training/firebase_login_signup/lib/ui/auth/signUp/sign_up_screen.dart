import 'dart:io';

import 'package:firebase_login_signup/components/already_have_an_account.dart';
import 'package:firebase_login_signup/components/custom_text.dart';
import 'package:firebase_login_signup/components/customized_text_form_field.dart';
import 'package:firebase_login_signup/components/or_divider.dart';
import 'package:firebase_login_signup/components/sigin_signup_with_google.dart';
import 'package:firebase_login_signup/constants.dart';
import 'package:firebase_login_signup/services/helper.dart';
import 'package:firebase_login_signup/ui/auth/authentication_bloc.dart';
import 'package:firebase_login_signup/ui/auth/login/login_screen.dart';
import 'package:firebase_login_signup/ui/auth/signUp/sign_up_bloc.dart';
import 'package:firebase_login_signup/ui/home/home_screen.dart';
import 'package:firebase_login_signup/ui/loading_cubit.dart';
import 'package:firebase_login_signup/utils/app_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();
  String? fullName, email, password, confirmPassword;
  AutovalidateMode _validate = AutovalidateMode.disabled;
  bool acceptEULA = false;

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc(),
      child: Builder(
        builder: (context) {
          if (!kIsWeb && Platform.isAndroid) {
            context.read<SignUpBloc>().add(RetrieveLostDataEvent());
          }
          return MultiBlocListener(
            listeners: [
              BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  context.read<LoadingCubit>().hideLoading();
                  if (state.authState == AuthState.authenticated) {
                    pushAndRemoveUntil(
                        context, HomeScreen(user: state.user!), false);
                  } else {
                    showSnackBar(
                        context,
                        state.message ??
                            'Couldn\'t sign up, Please try again.');
                  }
                },
              ),
              BlocListener<SignUpBloc, SignUpState>(
                listener: (context, state) async {
                  if (state is ValidFields) {
                    await context.read<LoadingCubit>().showLoading(
                        context, 'Creating new account, Please wait...', false);
                    if (!mounted) return;
                    context
                        .read<AuthenticationBloc>()
                        .add(SignupWithEmailAndPasswordEvent(
                          emailAddress: email!,
                          password: password!,
                          fullName: fullName,
                        ));
                  } else if (state is SignUpFailureState) {
                    showSnackBar(context, state.errorMessage);
                  }
                },
              ),
            ],
            child: Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: BlocBuilder<SignUpBloc, SignUpState>(
                    buildWhen: (old, current) =>
                        current is SignUpFailureState && old != current,
                    builder: (context, state) {
                      if (state is SignUpFailureState) {
                        _validate = AutovalidateMode.onUserInteraction;
                      }
                      return Form(
                        key: _key,
                        autovalidateMode: _validate,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtils.screenWidth * 0.06),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Sign Up".toUpperCase(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Hubballi",
                                    fontSize: 36),
                              ),
                              Image.asset("assets/welcome_screen_ills.jpg"),
                              const SizedBox(height: defaultPadding),
                              const SigninSinupGoogle(
                                text: "Sign Up with Google",
                              ),
                              const OrDivider(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomText(
                                    text: "Enter Name:",
                                  ),
                                  SizedBox(
                                    height: ScreenUtils.screenHeight * 0.002,
                                  ),
                                  CustomizedTextFormField(
                                    readOnly: false,
                                    validator: validateName,
                                    onSaved: (String? val) {
                                      fullName = val;
                                    },
                                    hintText: "Name",
                                    obscureText: false,
                                  ),
                                  SizedBox(
                                    height: ScreenUtils.screenHeight * 0.01,
                                  ),
                                  const CustomText(
                                    text: "Enter Email ID:",
                                  ),
                                  SizedBox(
                                    height: ScreenUtils.screenHeight * 0.002,
                                  ),
                                  CustomizedTextFormField(
                                    readOnly: false,
                                    validator: validateEmail,
                                    onSaved: (String? val) {
                                      email = val;
                                    },
                                    hintText: "Enter valid email",
                                    obscureText: false,
                                  ),
                                  SizedBox(
                                    height: ScreenUtils.screenHeight * 0.01,
                                  ),
                                  const CustomText(
                                    text: "Enter Password:",
                                  ),
                                  SizedBox(
                                    height: ScreenUtils.screenHeight * 0.002,
                                  ),
                                  CustomizedTextFormField(
                                    readOnly: false,
                                    controller: _passwordController,
                                    validator: validatePassword,
                                    onSaved: (String? val) {
                                      password = val;
                                    },
                                    hintText: "XXXXXXXX",
                                    obscureText: true,
                                  ),
                                  SizedBox(
                                    height: ScreenUtils.screenHeight * 0.01,
                                  ),
                                  const CustomText(
                                    text: "Confirm Password:",
                                  ),
                                  SizedBox(
                                    height: ScreenUtils.screenHeight * 0.002,
                                  ),
                                  CustomizedTextFormField(
                                    readOnly: false,
                                    onFieldSubmitted: (_) =>
                                        context.read<SignUpBloc>().add(
                                              ValidateFieldsEvent(_key,
                                                  acceptEula: acceptEULA),
                                            ),
                                    obscureText: true,
                                    validator: (val) => validateConfirmPassword(
                                        _passwordController.text, val),
                                    onSaved: (String? val) {
                                      confirmPassword = val;
                                    },
                                    hintText: "XXXXXXXX",
                                  ),
                                  ListTile(
                                    trailing:
                                        BlocBuilder<SignUpBloc, SignUpState>(
                                      buildWhen: (old, current) =>
                                          current is EulaToggleState &&
                                          old != current,
                                      builder: (context, state) {
                                        if (state is EulaToggleState) {
                                          acceptEULA = state.eulaAccepted;
                                        }
                                        return Checkbox(
                                          onChanged: (value) =>
                                              context.read<SignUpBloc>().add(
                                                    ToggleEulaCheckboxEvent(
                                                      eulaAccepted: value!,
                                                    ),
                                                  ),
                                          activeColor: kPrimaryColor,
                                          value: acceptEULA,
                                        );
                                      },
                                    ),
                                    title: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                        children: [
                                          const TextSpan(
                                            text:
                                                'By creating an account you agree to our ',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          TextSpan(
                                            style: const TextStyle(
                                              color: Colors.blueAccent,
                                            ),
                                            text: 'Terms of Use',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () async {
                                                if (await canLaunchUrl(
                                                    Uri.parse(''))) {
                                                  await launchUrl(
                                                    Uri.parse(''),
                                                  );
                                                }
                                              },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: ScreenUtils.screenHeight * 0.04,
                                  ),
                                  ElevatedButton(
                                    onPressed: () =>
                                        context.read<SignUpBloc>().add(
                                              ValidateFieldsEvent(_key,
                                                  acceptEula: acceptEULA),
                                            ),
                                    child: Text(
                                      "Sign Up".toUpperCase(),
                                      style: const TextStyle(
                                          fontFamily: "Poppins", fontSize: 21),
                                    ),
                                  ),
                                  const SizedBox(height: defaultPadding),
                                  AlreadyHaveAnAccountCheck(
                                    login: false,
                                    press: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return const LoginScreen();
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
}


