import 'package:graduation_project/report_module/presentation_layer/widgets/report_text_widget.dart';

import '../../../core/utils/exports.dart';
import '../../../growth_module/domain_layer/entities/growth.dart';

class LatestGrowthWidget extends StatelessWidget {
  final Growth growth;
  const LatestGrowthWidget({super.key, required this.growth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
        children: [
          const ReportTextWidget(text: AppStrings.growthInfo),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: '${AppStrings.height}  ',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      TextSpan(
                        text: '${growth.height} ',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.appBarColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                          text: ' ${AppStrings.cm} ',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          )),
                    ]),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  CustomText(
                    size: 13.sp,
                    text: growth.heightStatus,
                    fontWeight: FontWeight.normal,
                    color: growth.heightStatus.contains('طبيعي')
                        ? AppColors.greenColor
                        : AppColors.redColor,
                  ),
                ],
              ),
              SizedBox(
                width: 50.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: '${AppStrings.weight}  ',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      TextSpan(
                        text: '${growth.weight} ',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.appBarColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                          text: ' ${AppStrings.kg} ',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          )),
                    ]),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  CustomText(
                    text: growth.weightStatus,
                    fontWeight: FontWeight.normal,
                    size: 13.sp,
                    color: growth.weightStatus.contains('طبيعي')
                        ? AppColors.greenColor
                        : AppColors.redColor,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
