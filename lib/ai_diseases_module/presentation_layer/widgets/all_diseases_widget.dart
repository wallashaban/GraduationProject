
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
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      margin: EdgeInsets.all(4.r),
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
          CustomText(
            text: disease.createdAt,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              SvgPicture.asset(
                AppImages.cameraImage,
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: disease.disease == 'allergy'
                        ? AppStrings.allergyDisease
                        : disease.disease == 'bacteria'
                            ? AppStrings.bacteria
                            : AppStrings.allergyDisease,
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
                  size: 27.r,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
