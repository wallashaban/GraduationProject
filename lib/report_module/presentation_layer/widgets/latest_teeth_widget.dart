// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/app_strings.dart';
import 'package:graduation_project/report_module/presentation_layer/widgets/report_text_widget.dart';

import '../../../authentication_module/presentaion_layer/widgets/custom_text.dart';
import '../../../core/utils/app_colors.dart';
import '../../domain_layer/entity/latest_teeth.dart';

class LatestTeethWidget extends StatelessWidget {
  final LatestTeeth latestTeethModel;
  const LatestTeethWidget({
    Key? key,
    required this.latestTeethModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 15.h),
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 15.h),
      decoration: BoxDecoration(
        color: AppColors.backColor,
        borderRadius: BorderRadius.circular(
          15.r,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 5,
              blurStyle: BlurStyle.outer),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ReportTextWidget(text: AppStrings.teethInfo),
          SizedBox(
            height: 10.h,
          ),
          CustomText(
            text: latestTeethModel.teethStatus,
            size: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
