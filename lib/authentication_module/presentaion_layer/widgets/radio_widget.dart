import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import 'custom_text.dart';

class RadioWidget extends StatelessWidget {
  final dynamic onChanged;
  final String text;
  final String value;
  final String? groupValue;
  const RadioWidget({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
    required this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 24.h,
          width: 24.w,
          child: Radio(
              fillColor: MaterialStatePropertyAll(AppColors.appBarColor),
              activeColor: AppColors.appBarColor,
              value: value,
              groupValue: groupValue,
              onChanged: onChanged),
        ),
        SizedBox(
          width: 8.w,
        ),
        CustomText(
          text: text,
          size: 14.sp,
          color: AppColors.appBarColor,
          // fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
