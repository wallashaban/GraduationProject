// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:graduation_project/core/utils/app_strings.dart';
import 'package:graduation_project/prescription_module/presentation_layer/widgets/custom_divider.dart';
import 'package:graduation_project/report_module/presentation_layer/widgets/report_text_widget.dart';

import '../../../authentication_module/presentaion_layer/widgets/custom_text.dart';
import '../../domain_layer/entity/vaccination_report.dart';

class VaccineInfoWidget extends StatelessWidget {
  final List<VaccinationReport> vaccinationReportModel;
  const VaccineInfoWidget({
    Key? key,
    required this.vaccinationReportModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 15.h,
      ),
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
        children: [
          const ReportTextWidget(text: AppStrings.vaccineInfo),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: vaccinationReportModel[index].name,
                  size: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  children: [
                    CustomText(
                      text: vaccinationReportModel[index].prevention,
                      color: AppColors.darkGreyColor,
                      size: 12.sp,
                    ),
                    const Spacer(),
                    CustomText(
                      text: AppStrings.vaccinedone,
                      size: 12.sp,
                      color: AppColors.darkGreyColor,
                    ),
                    const Icon(
                      Icons.check_box,
                      color: Colors.green,
                    ),
                  ],
                ),
                if (index != vaccinationReportModel.length - 1)
                  const CustomDivider(
                    height: 14,
                    thickness: 0.4,
                  ),
              ],
            ),
            itemCount: vaccinationReportModel.length,
          )
        ],
      ),
    );
  }
}
