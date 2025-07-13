import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconButton? suffixIcon;
  final String labelText;
  final String hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final double radius;
  final TextInputType? textInputType;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    this.suffixIcon,
    required this.labelText,
    required this.hintText,
    this.radius = 0.00,
    this.prefixIcon,
    this.obscureText = false,
    this.textInputType,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,
        label: Text(labelText),
        hintText: hintText,
        //BORDES DEL TEXTFIELD BASE
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        //BORDES DEL TEXTFIELD CUANDO SE ESTA INTERACTUANDO
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: Colors.grey.shade500, width: 2),
        ),
      ),
    );
  }
}
