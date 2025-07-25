import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    this.onTap,
    this.color,
    this.textcolor,
    this.border,
  });
  final String text;
  final void Function()? onTap;
  final Color? color;
  final Color? textcolor;
  final BoxBorder? border;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: border,
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: textcolor,
          ),
        ),
      ),
    );
  }
}
