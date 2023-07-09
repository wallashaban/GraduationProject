import '../../../core/utils/exports.dart';

class SuccessPasswordScreen extends StatelessWidget {
  const SuccessPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.successImage),
            SizedBox(
              height: 56.h,
            ),
            CustomText(
              text: AppStrings.congratulation,
              // color: AppColors.darkColor,
              size: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            CustomText(
              text: AppStrings.successPassword,
              // color: AppColors.textColor,
              size: 16.sp,
              fontWeight: FontWeight.normal,
            ),
            SizedBox(
              height: 32.h,
            ),
            CustomButton(
              text: AppStrings.startnew,
              onPressed: () {
                AppConstants.navigateReplacement(
                    context: context, routeName: AppRoutes.login);
              },
              color: AppColors.textColor,
              size: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      )),
    );
  }
}
