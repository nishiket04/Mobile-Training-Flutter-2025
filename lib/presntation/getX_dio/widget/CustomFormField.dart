import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef bool Validatior(String value);

class CustomFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintTxt;
  final IconData prefixIcon;
  final TextInputType textInputType;
  final Validatior validateFunction;
  final String emptyErrorTxt;
  final String validatorErrorTxt;
  final bool obscureText;
  final IconButton? suffixIcon;

  CustomFormField({
    this.controller,
    required this.hintTxt,
    required this.prefixIcon,
    required this.textInputType,
    required this.validateFunction,
    required this.emptyErrorTxt,
    required this.validatorErrorTxt,
    this.obscureText = false,
    this.suffixIcon = null,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(prefixIcon),
        hintText: hintTxt,
        suffixIcon: suffixIcon
      ),
      keyboardType: textInputType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return emptyErrorTxt;
        } else if (!validateFunction(value)) {
          return validatorErrorTxt;
        }
        return null;
      },
    );
  }
}
