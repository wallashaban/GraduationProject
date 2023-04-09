// ignore_for_file: must_be_immutable

import 'package:graduation_project/core/utils/exports.dart';


class ResetScreen extends StatelessWidget {
  ResetScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.darkColor,
              )),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            top: 30.h,
            left: 30.w,
            right: 30.w,
          ),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CustomText(
                      text: AppStrings.resetPasswordTitle,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      size: 30.sp,
                    ),
                  ),
                  CustomText(
                    text: AppStrings.newPassword,
                    color: AppColors.darkColor,
                    size: 20.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  CustomText(
                    text: AppStrings.newPasswordTitle,
                    color: AppColors.textColor,
                    size: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      AppImages.forgetPasswordImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextFormField(
                                          obscureText: false,

                    controller: passwordController,
                    labelText: AppStrings.newPassword,
                    suffix: Icons.visibility_off_sharp,
                    validator: (value) {
                      if (value.isEmpty) {
                        return '';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextFormField(
                                          obscureText: false,

                    controller: confirmPasswordController,
                    labelText: AppStrings.confirmNewPassword,
                    suffix: Icons.visibility_off,
                    validator: (value) {
                      if (value.isEmpty) {
                        return '';
                      }
                    },
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Center(
                    child: CustomButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      text: AppStrings.confirm,
                      color: AppColors.darkColor,
                      size: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
