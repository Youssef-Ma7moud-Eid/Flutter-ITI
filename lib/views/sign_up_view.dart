import 'package:flutter/material.dart';
import 'package:iti_flutter/views/login_view.dart';
import 'package:iti_flutter/widgets/button_widget.dart';
import 'package:iti_flutter/widgets/text_field_sections.dart';
import 'package:iti_flutter/widgets/title_and_sub_title.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 18, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TitleText(text: 'Sign Up'),
                SubTitle(text: 'create your account'),
                SizedBox(height: 70),
                TextFieldSection(),
                SizedBox(height: 30),

                ButtonWidget(
                  textcolor: Colors.white,
                  color: Color(0XFF9B28B2),
                  text: 'Sign Up',
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginView()),
                    );
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
                        Navigator.of(context).pushReplacement(
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
