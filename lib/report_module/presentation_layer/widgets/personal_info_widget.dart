// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/prescription_module/presentation_layer/widgets/custom_divider.dart';
import 'package:graduation_project/report_module/presentation_layer/widgets/report_text_widget.dart';

import '../../domain_layer/entity/medical_info.dart';

class PersonalInfoWidget extends StatelessWidget {
  final MedicalInfo medicalInfoModel;
  const PersonalInfoWidget({
    Key? key,
    required this.medicalInfoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 15.h),
      margin: EdgeInsets.only(bottom: 16.h),
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
          const ReportTextWidget(
            text: AppStrings.personalInfo,
          ),
          CustomText(
            text: '${AppStrings.name}: ${medicalInfoModel.userName}',
            size: 16.sp,
            fontWeight: FontWeight.w500,
            maxLines: 2,
          ),
          const CustomDivider(
            height: 14,
            thickness: 0.4,
          ),
          CustomText(
            text:
                '${AppStrings.childAge}: ${medicalInfoModel.userAgeMonth}  ${AppStrings.month} ',
            size: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          const CustomDivider(
            height: 14,
            thickness: 0.4,
          ),
          if (medicalInfoModel.chronicDisease != null)
            CustomText(
              text:
                  '${AppStrings.chronicDisease}: ${medicalInfoModel.chronicDisease}',
              size: 16.sp,
              fontWeight: FontWeight.w500,
              maxLines: 2,
            ),
          if (medicalInfoModel.chronicDisease != null)
            const CustomDivider(
              height: 14,
              thickness: 0.4,
            ),
          if (medicalInfoModel.geneticDisease != null)
            CustomText(
              text:
                  '${AppStrings.geneticDisease}: ${medicalInfoModel.geneticDisease}',
              size: 16.sp,
              maxLines: 2,
              fontWeight: FontWeight.w500,
            ),
          if (medicalInfoModel.geneticDisease != null)
            const CustomDivider(
              height: 14,
              thickness: 0.4,
            ),
          if (medicalInfoModel.allergy != null)
            CustomText(
              text: '${AppStrings.allergy}: ${medicalInfoModel.allergy}',
              size: 16.sp,
              fontWeight: FontWeight.w500,
              maxLines: 2,
            ),
          if (medicalInfoModel.allergy != null)
            const CustomDivider(
              height: 14,
              thickness: 0.4,
            ),
          CustomText(
            text: '${AppStrings.bloodType}: ${medicalInfoModel.bloodType}',
            size: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
