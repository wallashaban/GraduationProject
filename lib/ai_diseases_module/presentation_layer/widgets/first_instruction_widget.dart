import '../../../core/utils/exports.dart';

class FirstInstructionWidget extends StatelessWidget {
  const FirstInstructionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.r),
      child: Column(
        children: [
          SvgPicture.asset(
            AppImages.aiTalkImage,
          ),
          SizedBox(
            height: 20.h,
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
