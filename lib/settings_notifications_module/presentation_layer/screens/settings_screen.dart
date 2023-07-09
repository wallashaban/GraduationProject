import 'package:graduation_project/settings_notifications_module/presentation_layer/cotrollers/settings_notifications_cubit.dart';
import 'package:hive/hive.dart';

import '../../../core/utils/exports.dart';
import '../../../prescription_module/presentation_layer/widgets/custom_divider.dart';
import '../widgets/settings_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubitAuth = BlocProvider.of<AuthenticationCubit>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 32.h, left: 24.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(
                    text: AppStrings.acount,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkColor,
                    size: 16.sp,
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(
                height: 6.h,
              ),
              BlocBuilder<AuthenticationCubit, AuthenticationState>(
                builder: (context, state) {
                  return SettingsWidget(
                    icon: Icons.abc,
                    isAccount: true,
                    text: cubitAuth.userData!.name,
                    widget: AppRoutes.updateUserDateScreen,
                    image: cubitAuth.userData!.photo ?? AppImages.signupImage,
                    gender: cubitAuth.userData!.gender,
                  );
                },
              ),
              const CustomDivider(
                thickness: 1.5,
              ),
              Container(
                height: 2.h,
                width: double.infinity,
                margin: EdgeInsets.only(
                  left: 30.w,
                  right: 30.w,
                  // bottom: 30.h,
                ),
              ),
      
              Row(
                children: [
                  CustomText(
                    text: AppStrings.settings,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkColor,
                    size: 16.sp,
                  ),
                  const Spacer(),
                ],
              ),
              SettingsWidget(
                icon: Icons.add,
                text: AppStrings.addNewBaby,
                isLogOut: true,
                //   widget: const OrdersScreen(),
              ),
              // orders
              SettingsWidget(
                icon: Icons.star_border,
                text: AppStrings.stars,
                //   widget: const OrdersScreen(),
              ),
      
              //language
              SettingsWidget(
                icon: Icons.favorite_border,
                text: AppStrings.toldFriends,
                //    widget: const LanguageScreen(),
              ),
              //addresses
              SettingsWidget(
                icon: Icons.info_outline,
                text: AppStrings.aboutApp,
                isAddress: true,
                widget: AppRoutes.aboutScreen,
              ),
              //feedback
              SettingsWidget(
                icon: Icons.email_outlined,
                text: AppStrings.contactUs,
                widget: AppRoutes.contactUsScreen,
              ),
      
              // about us
              SettingsWidget(
                icon: Icons.logout,
                text: AppStrings.signOut,
                isLogOut: true,
                // widget: const AboutUsScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
