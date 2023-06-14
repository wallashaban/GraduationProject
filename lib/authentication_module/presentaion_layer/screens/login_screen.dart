// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:connectivity_plus/connectivity_plus.dart';

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
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
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
                          //fontWeight: FontWeight.bold,
                          size: 20.sp,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Center(
                        child: SvgPicture.asset(
                          AppImages.loginImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      CustomTextFormField(
                        obscureText: false,
                        controller: emailController,
                        keyBoardType: TextInputType.emailAddress,
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
                            suffix: cubit.isPassword
                                ? PhosphorIcons.eyeClosedBold
                                : PhosphorIcons.eyeBold,
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
                      Align(
                        alignment: Alignment.topLeft,
                        child: CustomTextButton(
                          onPressed: () {
                            AppConstants.navigateTo(
                                context: context,
                                routeName: AppRoutes.enterEmailScreen);
                          },
                          text: AppStrings.forgetPassword,
                          color: AppColors.borderColor,
                          size: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      BlocConsumer<AuthenticationCubit, AuthenticationState>(
                        listener: (context, state) {
                          /*  if (state is LoginUserLoadingState) {
                            isLoading = true;
                          } else {
                            isLoading = false;
                          } */
                          if (state is LoginUserErrorState) {
                            AppConstants.showSnackbar(
                              context: context,
                              content: state.error.toString(),
                            );
                          } else if (state is LoginUserSuccessState) {
                            AppConstants.navigateReplacement(
                              context: context,
                              routeName: AppRoutes.bottomNavbar,
                            );
                          }
                        },
                        builder: (context, state) {
                          var cubit =
                              BlocProvider.of<AuthenticationCubit>(context);
                          if (state is LoginUserLoadingState) {
                            return CustomButton(
                              isLoading: true,
                            );
                          }
                          return CustomButton(
                            onPressed: () async {
                              if (await AppConstants.checkConnectivity() ==
                                  ConnectivityResult.none) {
                                AppConstants.showSnackbar(
                                  context: context,
                                  content: AppStrings.noInternet,
                                );
                              } else {
                                if (formKey.currentState!.validate()) {
                                  cubit.loginUser(
                                    LoginUserParameters(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                      fcmToken:
                                          CashHelper.getData(key: 'fcmToken'),
                                    ),
                                  );
                                }
                              }
                            },
                            text: AppStrings.loginText,
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
                            //color: AppColors.textColor,
                            size: 14.sp,
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
                            color: AppColors.appBarColor,
                            size: 14.sp,
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
      ),
    );
  }
}
