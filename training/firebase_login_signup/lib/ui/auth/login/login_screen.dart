import 'package:firebase_login_signup/components/already_have_an_account.dart';
import 'package:firebase_login_signup/components/custom_text.dart';
import 'package:firebase_login_signup/components/customized_text_form_field.dart';
import 'package:firebase_login_signup/components/or_divider.dart';
import 'package:firebase_login_signup/components/sigin_signup_with_google.dart';
import 'package:firebase_login_signup/constants.dart';
import 'package:firebase_login_signup/services/helper.dart';
import 'package:firebase_login_signup/ui/auth/authentication_bloc.dart';
import 'package:firebase_login_signup/ui/auth/signUp/sign_up_screen.dart';
import 'package:firebase_login_signup/ui/home/home_screen.dart';
import 'package:firebase_login_signup/ui/loading_cubit.dart';
import 'package:firebase_login_signup/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  final GlobalKey<FormState> _key = GlobalKey();
  AutovalidateMode _validate = AutovalidateMode.disabled;
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: MultiBlocListener(
            listeners: [
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) async {
                  if (state is ValidLoginFields) {
                    await context.read<LoadingCubit>().showLoading(
                        context, 'Logging in, Please wait...', false);
                    if (!mounted) return;
                    context.read<AuthenticationBloc>().add(
                          LoginWithEmailAndPasswordEvent(
                            email: email!,
                            password: password!,
                          ),
                        );
                  } else if (state is SignInWithGoogleState) {
                    // Dispatch the SignInWithGoogleEvent to the AuthenticationBloc
                    context
                        .read<AuthenticationBloc>()
                        .add(SignInWithGoogleEvent());
                  }
                },
              ),
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
            ],
            child: BlocBuilder<LoginBloc, LoginState>(
              buildWhen: (old, current) =>
                  current is LoginFailureState && old != current,
              builder: (context, state) {
                if (state is LoginFailureState) {
                  _validate = AutovalidateMode.onUserInteraction;
                }
                return Form(
                  key: _key,
                  autovalidateMode: _validate,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtils.screenWidth * 0.06),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: ScreenUtils.screenHeight * 0.05,
                          ),
                          const Text(
                            "LOGIN",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Hubballi",
                                fontSize: 36),
                          ),
                          Image.asset("assets/welcome_screen_ills.jpg"),
                          SigninSinupGoogle(
                            text: "Login with Google",
                            onPress: () => context
                                .read<LoginBloc>()
                                .add(SignInInWithGoogleLoginEvent()),
                          ),
                          const OrDivider(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: "Enter Email ID:",
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
                              CustomizedTextFormField(
                                readOnly: false,
                                hintText: "XXXXXXXX",
                                obscureText: true,
                                validator: validatePassword,
                                onSaved: (String? val) {
                                  password = val;
                                },
                                onFieldSubmitted: (password) => context
                                    .read<LoginBloc>()
                                    .add(ValidateLoginFieldsEvent(_key)),
                              ),
                              SizedBox(
                                height: ScreenUtils.screenHeight * 0.01,
                              ),
                              Center(
                                child: GestureDetector(
                                  // onTap: () => push(
                                  //     context, const ResetPasswordScreen()),
                                  child: const Text(
                                    "Forgot password?",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: kPrimaryColor,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtils.screenHeight * 0.01,
                              ),
                              Hero(
                                tag: "login_btn",
                                child: ElevatedButton(
                                  child: Text(
                                    "Login".toUpperCase(),
                                    style: const TextStyle(
                                        fontFamily: "Poppins", fontSize: 21),
                                  ),
                                  onPressed: () => context
                                      .read<LoginBloc>()
                                      .add(ValidateLoginFieldsEvent(_key)),
                                ),
                              ),
                              const SizedBox(height: defaultPadding),
                              AlreadyHaveAnAccountCheck(
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const SignUpScreen();
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
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
