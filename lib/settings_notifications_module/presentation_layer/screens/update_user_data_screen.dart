// ignore_for_file: must_be_immutable

import 'package:graduation_project/authentication_module/presentaion_layer/widgets/radio_widget.dart';
import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/settings_notifications_module/presentation_layer/cotrollers/settings_notifications_cubit.dart';

import '../cotrollers/reports_state.dart';

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
    Hive.openBox('userDataCach');
    //var box = Hive.box('userDataCach');
    var user = Hive.box('userDataCach').get('user');

    nameController.text = user.name;
    emailController.text = user.email;
    birthdateController.text = user.birthDate;
    phoneController.text = user.phone ?? '  ';
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<SettingsNotificationsCubit,
                      SettingsNotificationsState>(
                    builder: (context, state) {
                      var cubit =
                          BlocProvider.of<SettingsNotificationsCubit>(context);
                      return InkWell(
                        onTap: () {
                          cubit.pickImage();
                        },
                        child: Center(
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100.r),
                                child: cubit.pickedFile == null &&
                                        user.photo != null
                                    ? Image.network(
                                        user.photo,
                                        height: 150.h,
                                        width: 170.w,
                                        fit: BoxFit.fill,
                                      )
                                    : cubit.pickedFile == null
                                        ? SvgPicture.asset(
                                            AppImages.signupImage,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.file(
                                            cubit.file!,
                                            height: 150.h,
                                            width: 170.w,
                                            fit: BoxFit.fill,
                                          ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 5,
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: AppColors.appBarColor,
                                  child: IconButton(
                                      onPressed: () {
                                        cubit.deleteImage();
                                      },
                                      icon: Icon(
                                        cubit.pickedFile != null
                                            ? Icons.delete
                                            : Icons.edit,
                                        color: AppColors.white,
                                        size: 19,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: CustomText(
                      text: user.name,
                      //color: AppColors.textColor,
                      fontWeight: FontWeight.normal,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
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
                    height: 20.h,
                  ),
                  CustomTextFormField(
                    obscureText: false,
                    controller: birthdateController,
                    labelText: AppStrings.birth,
                    suffix: Icons.date_range_sharp,
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
                    height: 20.h,
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
                    height: 20.h,
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
                    height: 20.h,
                  ),
                  BlocBuilder<AuthenticationCubit, AuthenticationState>(
                    builder: (context, state) {
                      var cubit = BlocProvider.of<AuthenticationCubit>(context);
                      return Row(
                        children: [
                          RadioWidget(
                            text: AppStrings.female,
                            value: AppStrings.female,
                            onChanged: (value) {
                              cubit.chooseGender(value!);
                            },
                            groupValue: cubit.gender ?? user.gender,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.03,
                          ),
                          RadioWidget(
                            text: AppStrings.male,
                            value: AppStrings.male,
                            onChanged: (value) {
                              cubit.chooseGender(value!);
                            },
                            groupValue: cubit.gender ?? user.gender,
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlocConsumer<SettingsNotificationsCubit,
                      SettingsNotificationsState>(
                    listener: (context, state) {
                      if (state is UpdateUserInfoErrorState) {
                        AppConstants.showSnackbar(
                            context: context, content: state.error);
                      }
                      if (state is UpdateUserInfoLoadingState) {
                        isLoading = true;
                      } else {
                        isLoading = false;
                      }
                      if (state is UpdateUserInfoSuccessState) {
                        AppConstants.showSnackbar(
                          context: context,
                          content: 'تم التعديل بنجاح',
                        );
                      }
                    },
                    builder: (context, state) {
                      var cubit =
                          BlocProvider.of<SettingsNotificationsCubit>(context);
                      if (state is UpdateUserInfoLoadingState) {
                        return CustomButton(
                          isLoading: true,
                        );
                      }
                      return CustomButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.filePath == null
                                ? cubit.updateUserInfo(
                                    RegisterUserParameters(
                                      name: nameController.text,
                                      email: emailController.text.trim(),
                                      gender:
                                          BlocProvider.of<AuthenticationCubit>(
                                                      context)
                                                  .gender ??
                                              user.gender,
                                      birthDate: birthdateController.text,
                                      phone: phoneController.text,
                                    ),
                                  )
                                : cubit.updateUserInfo(
                                    RegisterUserParameters(
                                      name: nameController.text,
                                      email: emailController.text.trim(),
                                      gender:
                                          BlocProvider.of<AuthenticationCubit>(
                                                      context)
                                                  .gender ??
                                              user.gender,
                                      birthDate: birthdateController.text,
                                      photo: cubit.filePath,
                                      phone: phoneController.text,
                                    ),
                                  );
                          }
                        },
                        text: AppStrings.edit,
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.h,
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
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkColor,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
