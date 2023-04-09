// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:graduation_project/authentication_module/presentaion_layer/widgets/cutom_circular.dart';

import '../../../core/utils/app_colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final int maxLines;
  final TextAlign textAlign;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  final VoidCallback onPressed;
  final bool isLoading;
   double? width = 163.w;
   CustomButton({
    Key? key,
    required this.text,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    required this.color,
    required this.size,
    required this.fontWeight,
    required this.onPressed,
    this.isLoading = false,
    this.width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.lightColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10)),
        child: isLoading
            ? const CustomCircularProgress()
            : CustomText(
                text: text,
                color: color,
                size: size,
                fontWeight: fontWeight,
              ),
      ),
    );
  }
}
