// ignore_for_file: must_be_immutable





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/exports.dart';

class CheckCodeScreen extends StatelessWidget {
  CheckCodeScreen({super.key});
  var otp1 = TextEditingController();
  var otp2 = TextEditingController();
  var otp3 = TextEditingController();
  var otp4 = TextEditingController();
  var otp5 = TextEditingController();
  var otp6 = TextEditingController();

  var isLoading = false;
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
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: CustomText(
                  text: AppStrings.resetPasswordTitle,
                  color: AppColors.textColor,
                  size: 30.sp,
                  fontWeight: FontWeight.bold,
                )),
                SizedBox(
                  height: 30.h,
                ),
                CustomText(
                  text: AppStrings.verification,
                  color: AppColors.darkColor,
                  size: 20.sp,
                  fontWeight: FontWeight.normal,
                ),
                CustomText(
                  text: AppStrings.verficationTitle,
                  color: AppColors.textColor,
                  size: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OtpField(
                        controller: otp1,
                      ),
                      OtpField(
                        controller: otp2,
                      ),
                      OtpField(
                        controller: otp3,
                      ),
                      OtpField(
                        controller: otp4,
                      ),
                      OtpField(
                        controller: otp5,
                      ),
                      OtpField(
                        controller: otp6,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    CustomText(
                      text: AppStrings.notsend,
                      color: AppColors.textColor,
                      size: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTextButton(
                      text: AppStrings.resend,
                      onPressed: () {},
                      color: AppColors.darkColor,
                      size: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                    child:
                        BlocConsumer<AuthenticationCubit, AuthenticationState>(
                  listener: (context, state) {
                    if (state is CheckCodeLoadingState) {
                      isLoading = true;
                    } else {
                      isLoading = false;
                    }
                    if (state is CheckCodeErrorState) {
                      AppConstants.showSnackbar(
                          context: context, content: state.error);
                    } else if (state is CheckCodeSuccessState) {
                      AppConstants.navigateTo(
                        context: context,
                        routeName: AppRoutes.resetNewPasswordScreen,
                        arguments: '${otp1.text}${otp2.text}${otp3.text}${otp4.text}${otp5.text}${otp6.text}',
                      );
                    }
                  },
                  builder: (context, state) {
                    var cubit = BlocProvider.of<AuthenticationCubit>(context);
                    return CustomButton(
                      text: AppStrings.verificationCode,
                      onPressed: () {
                        String code = '${otp1.text}${otp2.text}${otp3.text}${otp4.text}${otp5.text}${otp6.text}';
                        debugPrint('code $code');
                        cubit.checkCode(code);
                      },
                      color: AppColors.textColor,
                      size: 18.sp,
                      fontWeight: FontWeight.bold,
                    );
                  },
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
