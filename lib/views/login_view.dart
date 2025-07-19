import 'package:flutter/material.dart';
import 'package:iti_flutter/views/sign_up_view.dart';
import 'package:iti_flutter/widgets/button_widget.dart';
import 'package:iti_flutter/widgets/text_form_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 18, vertical: 40),
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
                  icon: Icons.person,
                  text: 'Username',
                  observertext: false,
                ),
                SizedBox(height: 35),
                TextFieldForm(
                  icon: Icons.password,
                  text: 'Password',
                  observertext: true,
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * .15),

                ButtonWidget(
                  textcolor: Colors.white,
                  color: Color(0XFF9B28B2),
                  text: 'Login',
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginView()),
                    );
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
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => SignUpView()),
                        );
                      },
                      child: Text(
                        'Sign up',
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
