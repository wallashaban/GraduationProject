// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../core/utils/exports.dart';

class ResetNewPasswordScreen extends StatelessWidget {
  final String code;
  ResetNewPasswordScreen({super.key, required this.code});
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(30.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CustomText(
                    text: AppStrings.resetPasswordTitle,
                    // color: AppColors.textColor,
                    size: 25.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomText(
                  text: AppStrings.newpassword,
                  // color: AppColors.darkColor,
                  size: 18.sp,
                  //fontWeight: FontWeight.bold,
                ),
                CustomText(
                  text: AppStrings.createnewpassword,
                  // color: AppColors.meduimGreyColor,
                  size: 18.sp,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(child: SvgPicture.asset(AppImages.resetPasswordImage)),
                SizedBox(
                  height: 40.h,
                ),
                BlocBuilder<AuthenticationCubit, AuthenticationState>(
                  builder: (context, state) {
                    var cubit = BlocProvider.of<AuthenticationCubit>(context);

                    return CustomTextFormField(
                      controller: passwordController,
                      labelText: AppStrings.newPassword,
                      suffix: cubit.isPassword
                          ? PhosphorIcons.eyeClosed
                          : PhosphorIcons.eyeBold,
                      obscureText: cubit.isPassword,
                      sufixPressed: () {
                        cubit.obscurePassword();
                      },
                      validator: (value) {
                        return AppStrings.passwordTextForm;
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                BlocBuilder<AuthenticationCubit, AuthenticationState>(
                  builder: (context, state) {
                    var cubit = BlocProvider.of<AuthenticationCubit>(context);
                    return CustomTextFormField(
                      controller: confirmPasswordController,
                      labelText: AppStrings.confirmNewPassword,
                      obscureText: cubit.isPassword,
                      suffix: cubit.isPassword
                          ? PhosphorIcons.eyeClosed
                          : PhosphorIcons.eyeBold,
                      sufixPressed: () {
                        cubit.obscurePassword();
                      },
                      validator: (value) {
                        return AppStrings.confirmText;
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
                    listener: (context, state) {
                      if (state is UpdatePasswordErrorState) {
                        AppConstants.showSnackbar(
                            context: context, content: state.error);
                      } else if (state is UpdatePasswordSuccessState) {
                        AppConstants.navigateTo(
                            context: context,
                            routeName: AppRoutes.successPasswordScreen);
                      }
                    },
                    builder: (context, state) {
                      if (state is UpdatePasswordLoadingState) {
                        return CustomButton(
                          isLoading: true,
                        );
                      }
                      return CustomButton(
                        text: AppStrings.confirm,
                        onPressed: () async {
                          debugPrint('code $code');
                          if (await AppConstants.checkConnectivity() ==
                              ConnectivityResult.none) {
                            AppConstants.showSnackbar(
                              context: context,
                              content: AppStrings.noInternet,
                            );
                          } else {
                            BlocProvider.of<AuthenticationCubit>(context)
                                .updatePassword(
                              UpdatePasswordParameters(
                                code: code.toString(),
                                password: passwordController.text.trim(),
                                passwordConfirm:
                                    confirmPasswordController.text.trim(),
                              ),
                            );
                          }
                        },
                        color: AppColors.textColor,
                        size: 20.sp,
                        fontWeight: FontWeight.bold,
                      );
                    },
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
