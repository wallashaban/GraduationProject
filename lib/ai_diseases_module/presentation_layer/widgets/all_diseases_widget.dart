import '../../../core/caching_data/ai_disease_cach.dart';
import '../../../core/utils/exports.dart';

class AllDiseasesWidget extends StatelessWidget {
  final AiDisease disease;
  const AllDiseasesWidget({
    super.key,
    required this.disease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 16.h, bottom: 16.sp, right: 16.w, left: 12.w),
      margin: EdgeInsets.symmetric(vertical: 8.h),
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
          CustomText(
            text: disease.createdAt,
            size: 14.sp,
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              SvgPicture.asset(
                AppImages.cameraImage,
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    size: 14.sp,
                    text: disease
                        .disease /* == 'allergy'
                        ? AppStrings.allergyDisease
                        : disease.disease == 'bacteria'
                            ? AppStrings.bacteria
                            : AppStrings.allergyDisease */
                    ,
                  ),
                  /*  SizedBox(
                    height: 5.h,
                  ), */
                  CustomText(
                    text: disease.prediction,
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  AppConstants.showDialoog(
                    context,
                    id: disease.id,
                    isDisease: true,
                  );
                },
                icon: Icon(
                  Icons.delete_outline,
                  color: AppColors.appBarColor,
                  size: 24.r,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
