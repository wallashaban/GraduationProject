import '../../../core/utils/exports.dart';

class NormalGrowWidget extends StatelessWidget {
  const NormalGrowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColors.backColor,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 10,
              blurStyle: BlurStyle.outer),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppImages.growthImage,
              ),
              SizedBox(
                width: 15.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: AppStrings.average,
                    size: 16.sp,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomText(
                    text: '${AppStrings.height}  49.7 : 56.6 ${AppStrings.cm}',
                    size: 16.sp,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomText(
                    text: '${AppStrings.weight}  3.3 : 5.3 ${AppStrings.kg}',
                    size: 16.sp,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: CustomText(
              text: AppStrings.compare,
              size: 12.sp,
              textAlign: TextAlign.end,
              color: AppColors.darkGreyColor,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
