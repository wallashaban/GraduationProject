import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/caching_data/growth_cach.dart';
import 'package:graduation_project/growth_module/presentation_layer/screens/growth_screen.dart';
import '../../../core/utils/exports.dart';

class GrowthHistoryWidget extends StatelessWidget {
  final GrowrhCach growth;
  const GrowthHistoryWidget({super.key, required this.growth});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.backColor,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 3,
              blurStyle: BlurStyle.outer),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                color: AppColors.appBarColor,
              ),
              CustomText(
                text: '   ${growth.measureDate}',
                fontWeight: FontWeight.normal,
                size: 16.sp,
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    GrowParameters grow = GrowParameters(
                      isEdit: true,
                      growth: growth,
                    );
                    AppConstants.navigateTo(
                      context: context,
                      routeName: AppRoutes.growthScreen,
                      arguments: grow,
                    );
                  },
                  icon: Icon(
                    Icons.edit_outlined,
                    color: AppColors.appBarColor,
                    size: 24.r,
                  ))
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: '${AppStrings.height} ',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.normal,
                          )),
                      TextSpan(
                        text: growth.height,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.appBarColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                          text: ' ${AppStrings.cm} ',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.normal,
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
                          text: '${AppStrings.weight} ',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.normal,
                          )),
                      TextSpan(
                        text: growth.weight,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.appBarColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                          text: ' ${AppStrings.kg} ',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.normal,
                          )),
                    ]),
                  ),
                  SizedBox(
                    height: 8.h,
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
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
