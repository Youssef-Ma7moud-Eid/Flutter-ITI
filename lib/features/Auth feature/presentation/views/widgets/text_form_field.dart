import 'package:flutter/material.dart';

class TextFieldForm extends StatefulWidget {
  const TextFieldForm({
    super.key,
    this.icon,
    required this.text,
    required this.observertext,
    this.validator,
    this.onChanged,
    this.controller,
  });
  final IconData? icon;
  final String text;
  final bool observertext;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  State<TextFieldForm> createState() => _TextFieldFormState();
}

class _TextFieldFormState extends State<TextFieldForm> {
  bool observertext = false;
  IconData? iconeye = Icons.visibility;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      validator: widget.validator,
      obscureText: observertext,
      decoration: InputDecoration(
        filled: true, // Enable background fill
        fillColor: Color(0XFFEFE4F3),
        contentPadding: EdgeInsets.all(17),
        hintText: widget.text,
        hintStyle: TextStyle(
          color: Color.fromARGB(255, 85, 83, 85),
          fontSize: 18,
        ),
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.observertext
            ? IconButton(
                onPressed: () {
                  if (iconeye == Icons.visibility_off) {
                    observertext = false;
                    iconeye = Icons.visibility;
                  } else {
                    iconeye = Icons.visibility_off;
                    observertext = true;
                  }
                  setState(() {});
                },
                icon: Icon(iconeye),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
