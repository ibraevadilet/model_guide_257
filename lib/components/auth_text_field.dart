import 'package:flutter/material.dart';

class AuthTextFormFiled extends StatefulWidget {
  const AuthTextFormFiled({
    super.key,
    required this.hintText,
    required this.controller,
    this.onChanged,
  });

  final String hintText;
  final TextEditingController controller;
  final Function(String)? onChanged;

  @override
  State<AuthTextFormFiled> createState() => _AuthTextFormFiledState();
}

class _AuthTextFormFiledState extends State<AuthTextFormFiled> {
  final border = OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(12),
    ),
    borderSide: BorderSide(
      color: Colors.white.withOpacity(0.6),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: Colors.white.withOpacity(0.6),
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
        color: Colors.white,
      ),
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.6),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
          color: Colors.white,
        ),
        border: border,
        enabledBorder: border,
        disabledBorder: border,
        focusedBorder: border,
      ),
    );
  }
}
