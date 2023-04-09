// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/app_colors.dart';

class OtpField extends StatelessWidget {
  final controller;
  const OtpField({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50.h,
        width: 50.w,
        child: TextFormField(
          controller: controller,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.darkColor, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.darkColor, width: 2),
              )),
          style:
              Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20.sp),
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
          textAlign: TextAlign.center,
        ));
  }
}
