// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/exports.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final IconData? suffix;
  final IconData? prefix;
  final controller;
  final bool obscureText;
  final String? hintText;
  dynamic validator;
  dynamic onTap;
  dynamic sufixPressed;
  dynamic prefixPressed;
  final double width;
  final keyBoardType;
  final bool enabled;
  CustomTextFormField({
    Key? key,
    required this.controller,
    required this.obscureText,
    this.sufixPressed,
    this.hintText,
    this.keyBoardType = TextInputType.text,
    required this.labelText,
    this.suffix,
    required this.validator,
    this.onTap,
    this.width = double.infinity,
    this.prefixPressed,
    this.prefix,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      cursorColor: AppColors.black,
      controller: controller,
      keyboardType: keyBoardType,
      onTap: onTap,
      obscureText: obscureText,
      enabled: enabled,
      autocorrect: true,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        // contentPadding: EdgeInsets.only(right: 16.r),
        prefixIcon: null,
        suffixIcon: IconButton(
          onPressed: sufixPressed,
          icon: Icon(
            suffix,
            color: AppColors.disabledColor,
            size: 24.r,
          ),
        ),
      ),
    );
  }
}
