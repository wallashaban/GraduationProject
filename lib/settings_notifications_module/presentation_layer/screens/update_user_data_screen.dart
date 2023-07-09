// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:graduation_project/authentication_module/presentaion_layer/widgets/radio_widget.dart';
import 'package:graduation_project/core/utils/exports.dart';

class UpdateUserDataScreen extends StatelessWidget {
  UpdateUserDataScreen({
    super.key,
  });
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var birthdateController = TextEditingController();
  var phoneController = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: AppStrings.editProfile,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 32.w, top: 16.w, right: 24.w),
            child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
              listener: (context, state) {
                if (state is UpdateUserInfoErrorState) {
                  AppConstants.showSnackbar(
                      context: context, content: state.error);
                }

                if (state is UpdateUserInfoSuccessState) {
                  AppConstants.showSnackbar(
                    context: context,
                    content: 'تم التعديل بنجاح',
                  );
                }
              },
              builder: (context, state) {
                var cubit = BlocProvider.of<AuthenticationCubit>(context);
                nameController.text = cubit.userData!.name;
                emailController.text = cubit.userData!.email;
                birthdateController.text = cubit.userData!.birthDate!;
                phoneController.text = cubit.userData!.phone ?? '  ';
                return Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100.r),
                              child: cubit.pickedFile == null &&
                                      cubit.userData!.photo != null
                                  ? Image.network(
                                      cubit.userData!.photo!,
                                      height: 150.h,
                                      width: 170.w,
                                      fit: BoxFit.fill,
                                    )
                                  : cubit.pickedFile == null
                                      ? SvgPicture.asset(
                                          AppImages.signupImage,
                                          fit: BoxFit.fill,
                                          /*  height: 60.h,
                                          width: 60.w, */
                                        )
                                      : Image.file(
                                          cubit.file!,
                                          height: 150.h,
                                          width: 170.w,
                                          fit: BoxFit.fill,
                                        ),
                            ),
                            Positioned(
                              bottom: 10.h,
                              right: 5.w,
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: AppColors.appBarColor,
                                child: IconButton(
                                    onPressed: () {
                                      cubit.pickedFile == null
                                          ? cubit.pickImage()
                                          : cubit.deleteImage();
                                    },
                                    icon: Icon(
                                      cubit.pickedFile != null
                                          ? Icons.delete_outline
                                          : Icons.edit_outlined,
                                      color: AppColors.white,
                                      size: 19.r,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      /* SizedBox(
                        height: 4.h,
                      ), */
                      Center(
                        child: CustomText(
                          text: cubit.userData!.name,
                          fontWeight: FontWeight.normal,
                          size: 20.sp,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        obscureText: false,
                        controller: nameController,
                        labelText: AppStrings.nameSettings,
                        validator: (value) {
                          if (value.isEmpty) {
                            return AppStrings.nameText;
                          }
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        obscureText: false,
                        controller: birthdateController,
                        labelText: AppStrings.birth,
                        suffix: Icons.calendar_today_outlined,
                        validator: (value) {
                          if (value.isEmpty) {
                            return AppStrings.birthdateText;
                          }
                        },
                        keyBoardType: TextInputType.none,
                        onTap: () async {
                          birthdateController.text =
                              await AppConstants.showDate(context);
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        obscureText: false,
                        controller: emailController,
                        keyBoardType: TextInputType.emailAddress,
                        labelText: AppStrings.emailSettings,
                        validator: (value) {
                          /* if (value.isEmpty) {
                                    return AppStrings.emilTextForm;
                                  } */
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        obscureText: false,
                        keyBoardType: TextInputType.number,
                        controller: phoneController,
                        labelText: AppStrings.phone,
                        validator: (value) {
                          /* if (value.isEmpty) {
                                    return AppStrings.emilTextForm;
                                  } */
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          RadioWidget(
                            text: AppStrings.female,
                            value: AppStrings.female,
                            onChanged: (value) {
                              cubit.chooseGender(value!);
                            },
                            groupValue: cubit.gender ?? cubit.userData!.gender,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.03,
                          ),
                          RadioWidget(
                            text: AppStrings.male,
                            value: AppStrings.male,
                            onChanged: (value) {
                              cubit.chooseGender(value!);
                              debugPrint('gender ${cubit.userData!.gender}');
                            },
                            groupValue: cubit.gender ?? cubit.userData!.gender,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      if (state is UpdateUserInfoLoadingState)
                        CustomButton(
                          isLoading: true,
                        ),
                      if (state is! UpdateUserInfoLoadingState)
                        CustomButton(
                          onPressed: () async {
                            if (await AppConstants.checkConnectivity() ==
                                ConnectivityResult.none) {
                              AppConstants.showSnackbar(
                                context: context,
                                content: AppStrings.noInternet,
                              );
                            } else if (formKey.currentState!.validate()) {
                              cubit.filePath == null
                                  ? cubit.updateUserInfo(
                                      RegisterUserParameters(
                                        name: nameController.text,
                                        email: emailController.text.trim(),
                                        gender: BlocProvider.of<
                                                        AuthenticationCubit>(
                                                    context)
                                                .gender ??
                                            cubit.userData!.gender,
                                        birthDate: birthdateController.text,
                                        phone: phoneController.text,
                                      ),
                                    )
                                  : cubit.updateUserInfo(
                                      RegisterUserParameters(
                                        name: nameController.text,
                                        email: emailController.text.trim(),
                                        gender: BlocProvider.of<
                                                        AuthenticationCubit>(
                                                    context)
                                                .gender ??
                                            cubit.userData!.gender,
                                        birthDate: birthdateController.text,
                                        photo: cubit.filePath,
                                        phone: phoneController.text,
                                      ),
                                    );
                            }
                          },
                          text: AppStrings.edit,
                        ),
                      SizedBox(
                        height: 16.h,
                      ),
                      TextButton.icon(
                          onPressed: () {
                            AppConstants.navigateTo(
                              context: context,
                              routeName: AppRoutes.enterEmailScreen,
                            );
                          },
                          icon: Icon(
                            Icons.lock,
                            color: AppColors.darkColor,
                            size: 24.r,
                          ),
                          label: CustomText(
                            text: AppStrings.setPassword,
                            size: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkColor,
                          ))
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
