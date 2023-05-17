// ignore_for_file: must_be_immutable

import 'package:graduation_project/authentication_module/presentaion_layer/widgets/radio_widget.dart';
import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/settings_notifications_module/presentation_layer/cotrollers/settings_notifications_cubit.dart';
import 'package:hive/hive.dart';

import '../cotrollers/reports_state.dart';

class UpdateUserDataScreen extends StatelessWidget {
  UpdateUserDataScreen({
    super.key,
  });
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var birthdateController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('userData');
    var user = box.get('user');

    nameController.text = user.name;
    emailController.text = user.email;
    birthdateController.text = user.birthDate;

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
                  Center(
                    child: SvgPicture.asset(
                      AppImages.signupImage,
                      fit: BoxFit.cover,
                    ),
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

                    //  hintText: 'bla bla',
                    controller: nameController,
                    labelText: AppStrings.fullName,
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
                    labelText: AppStrings.birthdate,
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
                    labelText: AppStrings.email,
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
                      return CustomButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.updateUserInfo(
                              RegisterUserParameters(
                                name: nameController.text,
                                email: emailController.text.trim(),
                                gender: BlocProvider.of<AuthenticationCubit>(
                                        context)
                                    .gender,
                                birthDate: birthdateController.text,
                              ),
                            );
                          }
                        },
                        isLoading: isLoading,
                        text: AppStrings.edit,
                      );
                    },
                  ),
                  SizedBox(
                    height: 30.h,
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
