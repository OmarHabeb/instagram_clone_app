import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final String text;
  final Function(String) validator;
  final bool obscureText;
  
  CustomTextField(
      {super.key,
      required this.controller,
      this.prefixIcon,
      this.suffixIcon,
      required this.validator,
      required this.obscureText,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: TextInputType.name,
      controller: controller,
      validator: (String? value) {
        return validator(value!);
      },
      decoration: InputDecoration(
          label: Text(text),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white))),
    );
  }
}
