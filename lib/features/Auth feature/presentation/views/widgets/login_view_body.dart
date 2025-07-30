import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter/core/utils/functions/validation_email_method.dart';
import 'package:iti_flutter/core/utils/functions/validation_password_method.dart';
import 'package:iti_flutter/core/utils/helper/snack_bar.dart';
import 'package:iti_flutter/core/widgets/button_widget.dart';
import 'package:iti_flutter/features/Auth%20feature/presentation/manager/auth_cubit.dart';
import 'package:iti_flutter/features/Auth%20feature/presentation/manager/auth_state.dart';
import 'package:iti_flutter/features/Auth%20feature/presentation/views/otp_view.dart';
import 'package:iti_flutter/features/Auth%20feature/presentation/views/widgets/text_form_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String email = '';
  String password = '';
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SuccessAuthState) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Login Success',
            desc: 'Go to OTP',

            btnOkOnPress: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => OtpView()),
              );
            },
          ).show();
        } else if (state is FailureAuthState) {
          scaffoldmessenger(
            color: Colors.red,
            text: state.message,
            context: context,
          );
        }
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 18, vertical: 40),
            child: Form(
              autovalidateMode: autovalidateMode,
              key: formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Enter your credential to login',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 70),
                  TextFieldForm(
                    controller: emailController,
                    validator: validationEmailMethod(context: context),
                    onChanged: (mail) {
                      email = mail;
                    },
                    icon: Icons.email,
                    text: 'Email',
                    observertext: false,
                  ),
                  SizedBox(height: 35),
                  TextFieldForm(
                    controller: passwordController,
                    onChanged: (pass) {
                      password = pass;
                    },
                    validator: validationPasswordMethod(context: context),
                    icon: Icons.password,
                    text: 'Password',
                    observertext: true,
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * .15),

                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is LoadingAuthState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                            strokeWidth: 6,
                          ),
                        );
                      } else {
                        return ButtonWidget(
                          textcolor: Colors.white,
                          color: Color(0XFF9B28B2),
                          text: 'Login',
                          onTap: () async {
                            if (formState.currentState!.validate()) {
                              await AuthCubit.get(
                                context,
                              ).checkLogin(email, password);
                            } else {
                              setState(() {
                                autovalidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                        );
                      }
                    },
                  ),

                  SizedBox(height: MediaQuery.sizeOf(context).height * .05),
                  Text(
                    'Forget password?',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0XFF9B28B2),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * .05),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
