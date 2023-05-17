// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/app_strings.dart';
import '../../../authentication_module/presentaion_layer/widgets/custom_text.dart';
import '../../../core/utils/app_colors.dart';
import '../../domain_layer/entities/vaccination.dart';

class VaccineDetailsSecondComponent extends StatelessWidget {
  final Vaccination vaccineDetailsSecondModel;
  const VaccineDetailsSecondComponent({
    Key? key,
    required this.vaccineDetailsSecondModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 10.h, bottom: 5.h, left: 10.w, right: 10.w),
      decoration: BoxDecoration(
        color: AppColors.backColor,
        boxShadow: [
          BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 5,
              blurStyle: BlurStyle.outer),
        ],
        borderRadius: BorderRadius.circular(
          15.r,
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
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          CustomText(
            text:
                'يحتوى اللقاح الفموي المضاد لشلل الأطفال على فيروس ينشط إستجابة مناعية في الجسم و عندما يطعم الطفل باللقاح فإن الفيروس الموجود في اللقح يتكاثر في أمعائه' /* vaccineDetailsSecondModel.about */,
            maxLines: 7,
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
                text: AppStrings.diseasePrevention,
                size: 14.sp,
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomText(
            text: vaccineDetailsSecondModel.prevention, //
            size: 10.sp,
          ),
          SizedBox(
            height: 5.h,
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
            width: 5.w,
          ),
          CustomText(
            text: vaccineDetailsSecondModel.vaccineAge == '0'
                ? AppStrings.whileBorn
                : '${vaccineDetailsSecondModel.vaccineAge} ${AppStrings.month} ',
          ),
          SizedBox(
            height: 5.h,
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
            width: 5.w,
          ),
          CustomText(
            //side effect
            text: vaccineDetailsSecondModel.prevention,
            size: 10.sp,
          ),
        ],
      ),
    );
  }
}
