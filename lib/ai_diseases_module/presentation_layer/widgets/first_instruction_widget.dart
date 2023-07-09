import '../../../core/utils/exports.dart';

class FirstInstructionWidget extends StatelessWidget {
  const FirstInstructionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 24.w,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 56.h,
          ),
          Stack(
            children: [
              SvgPicture.asset(
                AppImages.aiTalkImage,
              ),
              Positioned(
                right: 135.w,
                width: 150.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 24.h,
                    horizontal: 6.w,
                  ),
                  child: CustomText(
                    text: AppStrings.robot,
                    maxLines: 6,
                    size: 10.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 32.h,
          ),
          CustomText(
            text: AppStrings.robbotAdvice,
            maxLines: 4,
            size: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        ],
      ),
    );
  }
}
