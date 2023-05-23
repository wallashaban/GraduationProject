// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final int maxLines;
  final TextAlign textAlign;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final VoidCallback? onPressed;
  final bool isLoading;
  double width;
  CustomButton(
      {Key? key,
       this.text,
      this.maxLines = 1,
      this.textAlign = TextAlign.start,
       this.color ,
       this.size,
       this.fontWeight,
       this.onPressed,
      this.isLoading = false,
      this.width = 220,// todo fixed width XX
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
     // height: 50.h,
     // width: width,
      child: ElevatedButton(
        
        onPressed: onPressed,
        child: isLoading
            ? CircularProgressIndicator(color: AppColors.white,)
            : CustomText(
                text: text!,
              ),
      ),
    );
  }
}
