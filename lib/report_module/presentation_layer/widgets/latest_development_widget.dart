// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/app_strings.dart';
import 'package:graduation_project/report_module/presentation_layer/widgets/report_text_widget.dart';

import '../../../authentication_module/presentaion_layer/widgets/custom_text.dart';
import '../../../core/utils/app_colors.dart';
import '../../domain_layer/entity/latest_development.dart';

class LatestDevelopmentWidget extends StatelessWidget {
  final LatestDevelopment latestDevelopmentModel;
  const LatestDevelopmentWidget({
    Key? key,
    required this.latestDevelopmentModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 15.h),
      decoration: BoxDecoration(
        color: AppColors.backColor,
        borderRadius: BorderRadius.circular(
          15.r,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 2,
              blurStyle: BlurStyle.outer),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ReportTextWidget(text: AppStrings.developmentInfo),
          SizedBox(
            height: 8.h,
          ),
          CustomText(
            text: AppStrings.babyAbility,
            size: 14.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 10.h,
          ),
          ListView.builder(
            itemBuilder: (context, index) => Row(
              children: [
                const Icon(
                  Icons.star,
                  size: 10,
                ),
                SizedBox(
                  width: 4.w,
                ),
                CustomText(
                  text: latestDevelopmentModel.question[index]['question'],
                  size: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: latestDevelopmentModel.question.length,
          ) //
        ],
      ),
    );
  }
}
