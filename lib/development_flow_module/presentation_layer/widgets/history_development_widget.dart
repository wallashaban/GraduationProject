import 'package:graduation_project/development_flow_module/presentation_layer/controllers/development_flow_cubit.dart';
import 'package:graduation_project/development_flow_module/presentation_layer/screens/subject_with_questions_screen.dart';

import '../../../core/utils/exports.dart';
import '../../domain_layer/entity/all_tips.dart';

class HistoryDevelopmentWidget extends StatelessWidget {
  final AllTips allTips;
  const HistoryDevelopmentWidget({
    super.key,
    required this.allTips,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        DevelopmentParameters parameters = DevelopmentParameters(
          isEdit: true,
          id: allTips.id,
        );
        AppConstants.navigateTo(
          context: context,
          routeName: AppRoutes.subjectWithQuestionScreen,
          arguments: parameters,
        );
      },
      child: Container(
          padding:
              EdgeInsets.only(right: 8.w, left: 16.h, top: 8.h, bottom: 12.h),
          margin: EdgeInsets.only(bottom: 16.h),
          decoration: BoxDecoration(
            color: AppColors.backColor,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[400]!,
                  blurRadius: 2,
                  blurStyle: BlurStyle.outer),
            ],
          ),
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.childImage,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    CustomText(
                      text: allTips.date,
                      size: 14.sp,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomText(
                    size: 14.sp,
                    text:
                        '${AppStrings.age} :  ${allTips.ageStage} ${AppStrings.month}')
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                AppConstants.navigateTo(
                  context: context,
                  routeName: AppRoutes.allTipsScreen,
                  arguments: allTips,
                );
              },
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppImages.lightImage,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomText(
                    text: AppStrings.tips,
                    color: AppColors.appBarColor,
                    size: 12.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
