import 'package:flutter/material.dart';
import 'package:iti_flutter/widgets/text_form_field.dart';

class TextFieldSection extends StatelessWidget {
  const TextFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldForm(
          icon: Icons.person,
          text: 'Username',
          observertext: false,
        ),
        SizedBox(height: 15),
        TextFieldForm(icon: Icons.email, text: 'Email', observertext: false),
        SizedBox(height: 15),
        TextFieldForm(
          icon: Icons.password,
          text: 'Password',
          observertext: true,
        ),
        SizedBox(height: 15),
        TextFieldForm(
          icon: Icons.password,
          text: 'Confirm Password',
          observertext: true,
        ),
      ],
    );
  }
}
