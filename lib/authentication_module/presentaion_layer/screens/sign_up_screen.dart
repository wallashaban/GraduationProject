// ignore_for_file: must_be_immutable




import 'package:graduation_project/core/utils/exports.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var confirmPasswordController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var birthdateController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CustomText(
                          text: AppStrings.createAccount,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          size: 30.sp,
                        ),
                      ),
                      CustomText(
                        text: AppStrings.welcomeText1,
                        color: AppColors.darkColor,
                        fontWeight: FontWeight.bold,
                        size: 20.sp,
                      ),
                      /*  const SizedBox(
                                height: 10,
                              ), */
                      CustomText(
                        text: AppStrings.welcomeText2,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        size: 18.sp,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                        child: SvgPicture.asset(
                          AppImages.signupImage,
                          /*  height: 209.04,
                                  width: 100.34, */
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                                              obscureText: false,

                        //hintText: 'bla bla',
                        controller: nameController,
                        labelText: AppStrings.fullName,
                        validator: (value) {
                          if (value.isEmpty) {
                            return AppStrings.nameText;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextFormField(
                                              obscureText: false,

                        controller: birthdateController,
                        labelText: AppStrings.birthdate,
                        suffix: Icons.date_range_sharp,
                        validator: (value) {
                          if (value.isEmpty) {
                            return AppStrings.birthdateText;
                          }
                        },
                        keyBoardType: TextInputType.none,
                        onTap: () async {
                          debugPrint(
                              'birthdate before${birthdateController.text}');

                          await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                          ).then((value) async {
                            if (value != null) {
                              debugPrint('bbirthdate $value');
                              birthdateController.text =
                                  '${value.year}-0${value.month}-${value.day}';
                            }
                          });
                          debugPrint(
                              'bbirthdate con${birthdateController.text}');
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextFormField(
                                              obscureText: false,

                        controller: emailController,
                        labelText: AppStrings.email,
                        validator: (value) {
                          if (value.isEmpty) {
                            return AppStrings.emilTextForm;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      BlocBuilder<AuthenticationCubit, AuthenticationState>(
                        builder: (context, state) {
                          var cubit =
                              BlocProvider.of<AuthenticationCubit>(context);
                          return CustomTextFormField(
                            controller: passwordController,
                            labelText: AppStrings.password,
                            suffix: PhosphorIcons.eyeClosed,
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
                      SizedBox(
                        height: 10.h,
                      ),
                      BlocBuilder<AuthenticationCubit, AuthenticationState>(
                        builder: (context, state) {
                          var cubit =
                              BlocProvider.of<AuthenticationCubit>(context);
                          return CustomTextFormField(
                            controller: confirmPasswordController,
                            labelText: AppStrings.confirmPassword,
                            suffix: PhosphorIcons.eyeClosed,
                            obscureText: cubit.isPassword,
                            sufixPressed: () {
                              cubit.obscurePassword();
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return AppStrings.confirmText;
                              }
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      BlocBuilder<AuthenticationCubit, AuthenticationState>(
                        builder: (context, state) {
                          var cubit =
                              BlocProvider.of<AuthenticationCubit>(context);
                          return Row(
                            children: [
                              Row(
                                children: [
                                  Radio(
                                      activeColor: AppColors.darkColor,
                                      value: AppStrings.female,
                                      groupValue: cubit.gender,
                                      onChanged: (value) {
                                        cubit.chooseGender(value!);
                                      }),
                                  CustomText(
                                    text: AppStrings.female,
                                    size: 20.sp,
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.03,
                              ),
                              Row(
                                children: [
                                  Radio(
                                    activeColor: AppColors.darkColor,
                                    value: AppStrings.male,
                                    groupValue: cubit.gender,
                                    onChanged: (value) {
                                      cubit.chooseGender(value!);
                                    },
                                  ),
                                  CustomText(
                                    text: AppStrings.male,
                                    size: 20.sp,
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                        child: BlocConsumer<AuthenticationCubit,
                            AuthenticationState>(
                          listener: (context, state) {
                            if (state is RegisterUserLoadingState) {
                              isLoading = true;
                            } else {
                              isLoading = false;
                            }
                            if (state is RegisterUserSuccessState) {
                              AppConstants.navigateReplacement(
                                context: context,
                                routeName: AppRoutes.bottomNavbar,
                              );
                            }
                            if (state is RegisterUserErrorState) {
                              AppConstants.showSnackbar(
                                  context: context, content: state.error);
                            }
                          },
                          builder: (context, state) {
                            var cubit =
                                BlocProvider.of<AuthenticationCubit>(context);
                            return CustomButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.registerUser(
                                    RegisterUserParameters(
                                      name: nameController.text,
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                      passwordConfirm:
                                          confirmPasswordController.text.trim(),
                                      gender: cubit.gender,
                                      birthDate: birthdateController.text,
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
                              text: AppStrings.createAccount,
                              color: AppColors.textColor,
                              size: 20.sp,
                              fontWeight: FontWeight.w600,
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: AppStrings.haveAccount,
                            color: AppColors.textColor,
                            size: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomTextButton(
                            text: AppStrings.loginText,
                            onPressed: () {
                              AppConstants.navigateTo(
                                context: context,
                                routeName: AppRoutes.login,
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
      ),
    );
  }
}
