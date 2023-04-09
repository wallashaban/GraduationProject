

import 'package:graduation_project/core/utils/exports.dart';


class SuccessPasswordScreen extends StatelessWidget {
  const SuccessPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              SvgPicture.asset(AppImages.successImage),
              SizedBox(
                height: 30.h,
              ),
              CustomText(
                text: AppStrings.congratulation,
                color: AppColors.darkColor,
                size: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: AppStrings.successPassword,
                color: AppColors.textColor,
                size: 20.sp,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
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
        ),
      )),
    );
  }
}