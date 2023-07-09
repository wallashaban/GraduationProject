import '../../../core/utils/exports.dart';

class OnboardingWidget extends StatelessWidget {
  final String title;
  final String image;
  const OnboardingWidget({
    super.key,
    require,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            height: 300.h,
            width: 325.w,
            image,
          ),
          SizedBox(
            height: 64.h,
          ),
          SizedBox(
            height: 80.h,
            child: CustomText(
              maxLines: 5,
              text: title,
              size: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
