import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/views/main_view.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 200,
          left: 0,
          child: Container(
            width: 100,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue.shade300,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          right: 0,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.pink.shade300,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomLeft: Radius.circular(100),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 35),
            height: MediaQuery.sizeOf(context).height * 0.5,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Color(0XFF1181A6),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Text(
                    '  OTP ادخل رمز التحقق ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'لقد ارسلنا الكود الخاص بك الي 010****000',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '00:سيبتهي هذا الكود في 03',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 50),
                  OtpTextField(
                    textStyle: TextStyle(fontSize: 17),
                    filled: true,
                    fillColor: Colors.white,
                    margin: EdgeInsets.only(right: 15),
                    borderColor: Colors.black,
                    borderWidth: 5,
                    numberOfFields: 6,
                    showFieldAsBox: true,
                    enabledBorderColor: Colors.white,
                    focusedBorderColor: Colors.white,
                  ),
                  SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => MainView()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'تاكيد',
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
