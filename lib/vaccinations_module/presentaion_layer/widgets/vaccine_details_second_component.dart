// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/app_strings.dart';
import '../../../authentication_module/presentaion_layer/widgets/custom_text.dart';
import '../../../core/utils/app_colors.dart';
import '../../domain_layer/entities/vaccination.dart';

class VaccineDetailsSecondComponent extends StatelessWidget {
  final Vaccination model;
  const VaccineDetailsSecondComponent({
    Key? key,
    required this.model,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.only(top: 4, bottom: 32.h, left: 4.w, right: 4.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 2,
              blurStyle: BlurStyle.outer),
        ],
        color: AppColors.backColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.star,
                size: 10.r,
              ),
              const SizedBox(
                width: 5,
              ),
              CustomText(
                text: AppStrings.aboutVaccine,
                size: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomText(
            text: model.about!,
            maxLines: 30,
            size: 11.sp,
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 10.r,
              ),
              const SizedBox(
                width: 5,
              ),
              CustomText(
                text: AppStrings.diseasePrevention,
                size: 14.sp,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomText(
            text: model.prevention, //
            size: 10.sp,
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 10.r,
              ),
              const SizedBox(
                width: 5,
              ),
              CustomText(
                text: AppStrings.vaccineTime,
                size: 14.sp,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomText(
            text: model.vaccineAge == '0'
                ? AppStrings.whileBorn
                : '${model.vaccineAge} ${AppStrings.month} ',
            size: 11.sp,
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 10.r,
              ),
              const SizedBox(
                width: 5,
              ),
              CustomText(
                text: AppStrings.sideEffects,
                size: 14.sp,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomText(
            text: model.sideEffects!,
            size: 11.sp,
            maxLines: 30,
          ),
        ],
      ),
    );
  }
}
