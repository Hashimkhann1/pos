import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {

  const AppTextField({
    required this.hintText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.enable = true,
    super.key});


  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final bool obscureText;
  final bool enable;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        cursorHeight: 15,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
        onChanged: onChanged,
        enabled: enable,
        onFieldSubmitted: onFieldSubmitted,
        obscureText: obscureText,
      ),
    );
  }
}
