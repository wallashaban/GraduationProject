import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(
      color: AppColors.textColor,
    ));
  }
}