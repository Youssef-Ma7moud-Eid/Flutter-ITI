import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  const SubTitle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 17,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 45,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}