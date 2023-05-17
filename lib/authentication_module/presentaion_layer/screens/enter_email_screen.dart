// ignore_for_file: must_be_immutable

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
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CustomText(
                    text: AppStrings.resetPasswordTitle,
                    color: AppColors.darkGreyColor,
                    size: 20.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomText(
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
                ),
                Center(child: SvgPicture.asset(AppImages.forgetPasswordImage)),
                SizedBox(
                  height: 40.h,
                ),
                CustomTextFormField(
                  obscureText: false,
                  controller: emailController,
                  labelText: AppStrings.enteremail,
                  validator: (value) {
                    return AppStrings.confirmText;
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
                    listener: (context, state) async {
                      if (state is ForgetPasswordLoadingState) {
                        isLoading = true;
                      } else {
                        isLoading = false;
                      }

                      if (state is ForgetPasswordErrorState) {
                        AppConstants.showSnackbar(
                            context: context, content: state.error);
                      }
                      if (state is ForgetPasswordSuccessState) {
                        AppConstants.showSnackbar(
                            context: context,
                            content: 'برجاء فحص البريد الالكترونى الخاص بك');

                        AppConstants.navigateTo(
                          context: context,
                          routeName: AppRoutes.checkCodeScreen,
                          arguments: emailController.text,
                        );
                        // );
                      }
                    },
                    builder: (context, state) => CustomButton(
                      text: AppStrings.sendcode,
                      onPressed: () {
                        BlocProvider.of<AuthenticationCubit>(context)
                            .forgetPassword(emailController.text.trim());
                      },
                      isLoading: isLoading,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
