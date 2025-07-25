
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 6,
            blurRadius: 6,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hoverColor: Colors.black,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search',
          hintStyle: TextStyle(color: Color(0XFFAFAFAF), fontSize: 18),
          prefixIcon: Icon(Icons.search, color: Color(0XFFFFDC61), size: 32),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}