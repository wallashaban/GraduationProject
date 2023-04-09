// ignore_for_file: must_be_immutable
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
                  text: AppStrings.newpassword,
                  color: AppColors.darkColor,
                  size: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomText(
                  text: AppStrings.createnewpassword,
                  color: AppColors.textColor,
                  size: 18.sp,
                  fontWeight: FontWeight.bold,
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
                      return CustomButton(
                        text: AppStrings.confirm,
                        onPressed: () {
                          debugPrint('code $code');
                          BlocProvider.of<AuthenticationCubit>(context)
                              .updatePassword(
                            UpdatePasswordParameters(
                              code: code.toString(),
                              password: passwordController.text.trim(),
                              passwordConfirm:
                                  confirmPasswordController.text.trim(),
                            ),
                          );
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
