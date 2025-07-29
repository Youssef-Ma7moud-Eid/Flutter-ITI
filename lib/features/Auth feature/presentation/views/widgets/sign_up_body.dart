import 'package:flutter/material.dart';
import 'package:iti_flutter/core/cache/cache_helper.dart';
import 'package:iti_flutter/core/utils/functions/validation_email_method.dart';
import 'package:iti_flutter/core/utils/functions/validation_password_method.dart';
import 'package:iti_flutter/core/utils/helper/quick_alert.dart';
import 'package:iti_flutter/core/utils/helper/snack_bar.dart';
import 'package:iti_flutter/features/Auth%20feature/data/repo/repo_implement.dart';
import 'package:iti_flutter/features/Auth%20feature/presentation/views/login_view.dart';
import 'package:iti_flutter/core/widgets/button_widget.dart';
import 'package:iti_flutter/features/Auth%20feature/presentation/views/widgets/text_form_field.dart';
import 'package:iti_flutter/features/Auth%20feature/presentation/views/widgets/title_and_sub_title.dart';
import 'package:quickalert/models/quickalert_type.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  String confirmPassword = '';
  String password = '';
  String email = '';
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
                TitleText(text: 'Sign Up'),
                SubTitle(text: 'create your account'),
                SizedBox(height: 70),
                TextFieldForm(
                  icon: Icons.person,
                  text: 'Username',
                  observertext: false,
                ),
                SizedBox(height: 15),
                TextFieldForm(
                  validator: validationEmailMethod(context: context),
                  onChanged: (mail) {
                    email = mail;
                  },
                  icon: Icons.email,
                  text: 'Email',
                  observertext: false,
                ),
                SizedBox(height: 15),
                TextFieldForm(
                  onChanged: (pass) {
                    password = pass;
                  },
                  validator: validationPasswordMethod(context: context),
                  icon: Icons.password,
                  text: 'Password',
                  observertext: true,
                ),
                SizedBox(height: 15),
                TextFieldForm(
                  validator: validationPasswordMethod(context: context),

                  onChanged: (confirmpass) {
                    confirmPassword = confirmpass;
                  },
                  icon: Icons.password,
                  text: 'Confirm Password',
                  observertext: true,
                ),
                SizedBox(height: 30),

                ButtonWidget(
                  textcolor: Colors.white,
                  color: Color(0XFF9B28B2),
                  text: 'Sign Up',
                  onTap: () async {
                    if (formState.currentState!.validate()) {
                      if (password == confirmPassword) {
                        print(email);
                         print(password);
                        dynamic message = await AuthRepoImplement()
                            .createUserWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                        if (message == null) {
                          await CacheHelper().saveData(
                            key: 'NewUser',
                            value: true,
                          );

                          showCustomAlert(
                            context: context,
                            title: 'Success!',
                            text: 'You have signed up successfully.',
                            type: QuickAlertType.success,
                            confirmBtnText: 'Go to Login',
                            onConfirm: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => LoginView(),
                                ),
                              );
                            },
                          );
                        } else {
                          scaffoldmessenger(
                            color: Colors.red,
                            text: message,
                            context: context,
                          );
                        }
                      } else {
                        scaffoldmessenger(
                          color: Colors.red,
                          text: 'password dont match ',
                          context: context,
                        );
                      }
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
                SizedBox(height: 15),
                Text(
                  'Or',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 15),
                ButtonWidget(
                  text: 'Sign in with Google',
                  textcolor: Color.fromARGB(255, 162, 85, 168),
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 1.5, // Border thickness
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * .05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account ?',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0XFF9B28B2),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
