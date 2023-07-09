// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:graduation_project/core/utils/exports.dart';

class EnterEmailScreen extends StatelessWidget {
  EnterEmailScreen({super.key});
  var emailController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(
            top: 16.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CustomText(
                    text: AppStrings.resetPasswordTitle,
                    color: AppColors.black,
                    size: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                /* CustomText(
                  text: AppStrings.forgetpassword,
                  color: AppColors.darkGreyColor,
                  size: 20.sp,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomText(
                  text: AppStrings.dontworry,
                  color: AppColors.meduimGreyColor,
                  size: 16.sp,
                ),
                SizedBox(
                  height: 40.h,
                ), */
                Center(child: SvgPicture.asset(AppImages.forgetPasswordImage)),
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 24.w, left: 32.w),
                  child: CustomTextFormField(
                    obscureText: false,
                    controller: emailController,
                    keyBoardType: TextInputType.emailAddress,
                    labelText: AppStrings.enteremail,
                    validator: (value) {
                      return AppStrings.confirmText;
                    },
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Center(
                  child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
                      listener: (context, state) async {
                    if (state is ForgetPasswordErrorState) {
                      AppConstants.showSnackbar(
                          context: context, content: state.error);
                    }
                    if (state is ForgetPasswordSuccessState) {
                      await AppConstants.showSnackbar(
                          //todo handle snackbar
                          context: context,
                          content:
                              'برجاء فحص البريد الالكترونى الخاص بك , فنحن نرسل رمز التحقق');

                      AppConstants.navigateTo(
                        context: context,
                        routeName: AppRoutes.checkCodeScreen,
                        arguments: emailController.text,
                      );
                      // );
                    }
                  }, builder: (context, state) {
                    if (state is ForgetPasswordLoadingState) {
                      return CustomButton(
                        isLoading: true,
                      );
                    }
                    return CustomButton(
                      text: AppStrings.sendcode,
                      onPressed: () async {
                        if (await AppConstants.checkConnectivity() ==
                            ConnectivityResult.none) {
                          AppConstants.showSnackbar(
                            context: context,
                            content: AppStrings.noInternet,
                          );
                        } else {
                          BlocProvider.of<AuthenticationCubit>(context)
                              .forgetPassword(emailController.text.trim());
                        }
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
