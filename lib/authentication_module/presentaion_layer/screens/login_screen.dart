// ignore_for_file: must_be_immutable
import '../../../core/utils/exports.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            //top: 5.h,
            left: 30.w,
            right: 30.w,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CustomText(
                        text: AppStrings.loginText,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        size: 25.sp,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Center(
                      child: SvgPicture.asset(
                        AppImages.loginImage,
                        /*  height: 209.04,
                        width: 217.34, */
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomTextFormField(
                      obscureText: false,
                      controller: emailController,
                      labelText: AppStrings.emilTextForm,
                      validator: (value) {
                        if (value.isEmpty) {
                          return AppStrings.emilTextForm;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    BlocBuilder<AuthenticationCubit, AuthenticationState>(
                      builder: (context, state) {
                        var cubit =
                            BlocProvider.of<AuthenticationCubit>(context);
                        return CustomTextFormField(
                          controller: passwordController,
                          labelText: AppStrings.passwordTextForm,
                          suffix: PhosphorIcons.eyeClosedBold,
                          obscureText: cubit.isPassword,
                          sufixPressed: () {
                            cubit.obscurePassword();
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return AppStrings.passwordTextForm;
                            }
                          },
                        );
                      },
                    ),
                    CustomTextButton(
                      onPressed: () {
                        AppConstants.navigateTo(
                            context: context,
                            routeName: AppRoutes.enterEmailScreen);
                      },
                      text: AppStrings.forgetPassword,
                      color: AppColors.borderColor,
                      size: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    BlocConsumer<AuthenticationCubit, AuthenticationState>(
                      listener: (context, state) {
                        if (state is LoginUserErrorState) {
                          isLoading = true;
                        } else {
                          isLoading = false;
                        }
                        if (state is LoginUserErrorState) {
                          AppConstants.showSnackbar(
                            context: context,
                            content: state.error.toString(),
                          );
                        } else if (state is LoginUserSuccessState) {
                          /* Navigator.pushReplacementNamed(
                              context, AppRoutes.bottomNavbar);
                          */ AppConstants.navigateReplacement(
                            context: context,
                            routeName: AppRoutes.bottomNavbar,
                          );
                        }
                      },
                      builder: (context, state) {
                        var cubit =
                            BlocProvider.of<AuthenticationCubit>(context);
                        return Center(
                          child: CustomButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.loginUser(
                                  LoginUserParameters(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                    fcmToken: AppStrings.token,
                                  ),
                                );
                                CashHelper.saveData(
                                  key: 'token',
                                  value: cubit.user.accessToken,
                                );
                              }
                            },
                            isLoading: isLoading,
                            text: AppStrings.loginText,
                            color: AppColors.textColor,
                            size: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: AppStrings.notHaveAccount,
                          color: AppColors.textColor,
                          size: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomTextButton(
                          text: AppStrings.createAccount,
                          onPressed: () {
                            AppConstants.navigateTo(
                              context: context,
                              routeName: AppRoutes.signUp,
                            );
                          },
                          color: AppColors.darkColor,
                          size: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
