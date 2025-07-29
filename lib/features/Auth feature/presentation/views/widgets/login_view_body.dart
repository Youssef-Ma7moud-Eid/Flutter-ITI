import 'package:flutter/material.dart';
import 'package:iti_flutter/core/utils/functions/validation_email_method.dart';
import 'package:iti_flutter/core/utils/functions/validation_password_method.dart';
import 'package:iti_flutter/core/utils/helper/quick_alert.dart';
import 'package:iti_flutter/core/utils/helper/snack_bar.dart';
import 'package:iti_flutter/core/widgets/button_widget.dart';
import 'package:iti_flutter/features/Auth%20feature/data/repo/repo_implement.dart';
import 'package:iti_flutter/features/Auth%20feature/presentation/views/otp_view.dart';
import 'package:iti_flutter/features/Auth%20feature/presentation/views/widgets/text_form_field.dart';
import 'package:quickalert/models/quickalert_type.dart';

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  onChanged: (pass) {
                    password = pass;
                  },
                  validator: validationPasswordMethod(context: context),
                  icon: Icons.password,
                  text: 'Password',
                  observertext: true,
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * .15),

                ButtonWidget(
                  textcolor: Colors.white,
                  color: Color(0XFF9B28B2),
                  text: 'Login',
                  onTap: () async {
                    if (formState.currentState!.validate()) {
                      dynamic message = await AuthRepoImplement()
                          .signInWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                      if (message == null) {
                        showCustomAlert(
                          context: context,
                          title: 'Success!',
                          text: 'You have signed up successfully.',
                          type: QuickAlertType.success,
                          confirmBtnText: 'Ok',
                          onConfirm: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => OtpView(),
                              ),
                            );
                          },
                        );
                      } else {
                        scaffoldmessenger(
                          context: context,
                          text: message,
                          color: Colors.red,
                        );
                      }
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
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
    );
  }
}
