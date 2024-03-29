// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../core/utils/exports.dart';

class CheckCodeScreen extends StatelessWidget {
  final String email;
  CheckCodeScreen({super.key, required this.email});
  var otp1 = TextEditingController();
  var otp2 = TextEditingController();
  var otp3 = TextEditingController();
  var otp4 = TextEditingController();
  var otp5 = TextEditingController();
  var otp6 = TextEditingController();

  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthenticationCubit>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 16.h, left: 32.w, right: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: CustomText(
                    text: AppStrings.resetPasswordTitle,
                    size: 20.sp,
                  )),
                  SizedBox(
                    height: 64.h,
                  ),
                  /* CustomText(
                    text: AppStrings.verification,
                    // color: AppColors.darkColor,
                    size: 18.sp,
                    // fontWeight: FontWeight.normal,
                  ),
                  CustomText(
                    text: AppStrings.verficationTitle,
                    color: AppColors.meduimGreyColor,
                    size: 18.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(
                    height: 30.h,
                  ), */
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
                    height: 32.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: AppStrings.notsend,
                        //color: AppColors.darkGreyColor,
                        size: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      BlocListener<AuthenticationCubit, AuthenticationState>(
                        listener: (context, state) {
                          if (state is ForgetPasswordSuccessState) {
                            AppConstants.showSnackbar(
                                context: context,
                                content:
                                    'برجاء فحص البريد الالكترونى الخاص بك');
                          }
                        },
                        child: CustomTextButton(
                          text: AppStrings.resend,
                          onPressed: () {
                            cubit.forgetPassword(
                              email,
                            );
                          },
                          color: AppColors.appBarColor,
                          size: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Center(
                      child: BlocConsumer<AuthenticationCubit,
                          AuthenticationState>(
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
                          arguments:
                              '${otp1.text}${otp2.text}${otp3.text}${otp4.text}${otp5.text}${otp6.text}',
                        );
                      }
                    },
                    builder: (context, state) {
                      var cubit = BlocProvider.of<AuthenticationCubit>(context);
                      if (state is CheckCodeLoadingState) {
                        return CustomButton(
                          isLoading: true,
                        );
                      }
                      return CustomButton(
                        text: AppStrings.verificationCode,
                        onPressed: () async {
                          if (await AppConstants.checkConnectivity() ==
                              ConnectivityResult.none) {
                            AppConstants.showSnackbar(
                              context: context,
                              content: AppStrings.noInternet,
                            );
                          } else {
                            String code =
                                '${otp1.text}${otp2.text}${otp3.text}${otp4.text}${otp5.text}${otp6.text}';
                            debugPrint('code $code');
                            cubit.checkCode(code);
                          }
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
      ),
    );
  }
}
