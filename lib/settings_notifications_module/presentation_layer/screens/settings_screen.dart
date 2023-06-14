import 'package:graduation_project/settings_notifications_module/presentation_layer/cotrollers/settings_notifications_cubit.dart';
import 'package:hive/hive.dart';

import '../../../core/utils/exports.dart';
import '../../../prescription_module/presentation_layer/widgets/custom_divider.dart';
import '../cotrollers/settings_notifications_state.dart';
import '../widgets/settings_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubitAuth = BlocProvider.of<AuthenticationCubit>(context);

    var cubit = BlocProvider.of<SettingsNotificationsCubit>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText(
                  text: AppStrings.acount,
                  fontWeight: FontWeight.bold,
                  color: AppColors.appBarColor,
                  size: 16.sp,
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 15,
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
            const CustomDivider(),
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
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
              ],
            ),
            // orders
            SettingsWidget(
              icon: Icons.add_shopping_cart_outlined,
              text: AppStrings.stars,
              //   widget: const OrdersScreen(),
            ),

            //language
            SettingsWidget(
              icon: Icons.language_sharp,
              text: AppStrings.toldFriends,
              //    widget: const LanguageScreen(),
            ),
            //addresses
            SettingsWidget(
              icon: Icons.location_on,
              text: AppStrings.aboutApp,
              isAddress: true,
              widget: AppRoutes.aboutScreen,
            ),
            //feedback
            SettingsWidget(
              icon: Icons.feedback_sharp,
              text: AppStrings.contactUs,
              widget: AppRoutes.contactUsScreen,
            ),
            SettingsWidget(
              icon: Icons.add_shopping_cart_outlined,
              text: AppStrings.addNewBaby,
              isLogOut: true,
              //   widget: const OrdersScreen(),
            ),
            // about us
            SettingsWidget(
              icon: Icons.info,
              text: AppStrings.signOut,
              isLogOut: true,
              // widget: const AboutUsScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
