import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/report_module/presentation_layer/widgets/report_text_widget.dart';

import '../../domain_layer/entity/disease_report.dart';

class DiseaseInfoWidget extends StatelessWidget {
  final List<DiseaseReport> diseaseReportModel;
  const DiseaseInfoWidget({
    Key? key,
    required this.diseaseReportModel,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ReportTextWidget(text: AppStrings.diseaseInfo),
          SizedBox(
            height: 10.h,
          ),
          CustomText(
            text: AppStrings.babyDisease,
            size: 14.sp,
            fontWeight: FontWeight.w600,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Row(
              children: [
                CustomText(
                  text: diseaseReportModel[index].disease=='allergy'?AppStrings.allergyDisease:
                  diseaseReportModel[index].disease=='bacteria'?AppStrings.bacteria:AppStrings.aboutApp,
                  size: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
                const Spacer(),
                CustomText(
                  text: diseaseReportModel[index].createdAt,
                  size: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            itemCount: diseaseReportModel.length,
          )
        ],
      ),
    );

    /*  return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.splashColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.textColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: const Text(
              AppStrings.diseaseInfo,
            ),
          ),
          Column(
            children:  [
              const Text(AppStrings.babyDisease),
              Row(
                children: [
                  Text(diseaseReportModel.disease),
                  Text(diseaseReportModel.createdAt),
                ],
              ),
            ],
          ),
          
        ],
      ),
    );
  */
  }
}
