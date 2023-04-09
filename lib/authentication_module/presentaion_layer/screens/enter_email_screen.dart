// ignore_for_file: must_be_immutable

import 'package:graduation_project/core/utils/exports.dart';



class EnterEmailScreen extends StatelessWidget {
  EnterEmailScreen({super.key});
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CustomText(
                    text: AppStrings.resetPasswordTitle,
                    color: AppColors.textColor,
                    size: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomText(
                  text: AppStrings.forgetpassword,
                  color: AppColors.darkColor,
                  size: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomText(
                  text: AppStrings.dontworry,
                  color: AppColors.textColor,
                  size: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(child: SvgPicture.asset('assets/images/Group 1066.svg')),
                SizedBox(
                  height: 40.h,
                ),
                CustomTextFormField(
                  obscureText: false,
                  controller: emailController,
                  labelText: AppStrings.enteremail,
                  validator: (value) {},
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: BlocListener<AuthenticationCubit, AuthenticationState>(
                    listener: (context, state) async {
                      if (state is ForgetPasswordErrorState) {
                        AppConstants.showSnackbar(
                            context: context, content: state.error);
                      }
                      if (state is ForgetPasswordSuccessState) {
                        AppConstants.showSnackbar(
                            context: context,
                            content: 'برجاء فحص البريد الالكترونى الخاص بك');
                        /*   await Future.delayed(const Duration(seconds: 3))
                            .then((value) =>  */
                        AppConstants.navigateTo(
                          context: context,
                          routeName: AppRoutes.checkCodeScreen,
                        );
                        // );
                      }
                    },
                    child: CustomButton(
                      text: AppStrings.sendcode,
                      onPressed: () {
                        BlocProvider.of<AuthenticationCubit>(context)
                            .forgetPassword(emailController.text.trim());
                      },
                      color: AppColors.textColor,
                      size: 20.sp,
                      fontWeight: FontWeight.bold,
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
