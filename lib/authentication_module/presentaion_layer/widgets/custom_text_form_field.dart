// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';

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
  CustomTextFormField({
    Key? key,
    required this.controller,
    required this.obscureText,
    this.sufixPressed,
    this.hintText,
    this.keyBoardType = TextInputType.name,
    required this.labelText,
    this.suffix,
    required this.validator,
    this.onTap,
    this.width=double.infinity,
    this.prefixPressed,
    this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        keyboardType: keyBoardType,
        onTap: onTap,
        obscureText: obscureText,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: AppColors.textFielfColor),
        autocorrect: true,
        cursorColor: AppColors.darkColor,
        validator: validator,
        decoration: InputDecoration(
          fillColor: AppColors.appBarColor,
          focusColor: AppColors.textColor,
          labelStyle: TextStyle(
              color: AppColors.borderColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp),
          hintText: hintText,
          labelText: labelText,
          suffixIconColor: AppColors.borderColor,
          prefixIcon:IconButton(
            onPressed: prefixPressed,
            icon: Icon(prefix),
            color: AppColors.textColor,
          ),
          suffixIcon: IconButton(
            onPressed: sufixPressed,
            icon: Icon(suffix),
            color: AppColors.darkColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.darkColor, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.borderColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.errorColor, width: 2),
          ),
        ),
      ),
    );
  }
}
