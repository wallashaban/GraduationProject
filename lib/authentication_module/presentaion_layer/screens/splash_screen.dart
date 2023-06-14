import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:graduation_project/authentication_module/presentaion_layer/screens/on_boarding_screen.dart';

import '../../../core/utils/exports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 260.w,
      nextScreen: CashHelper.getData(key: 'onboarding') == null
          ? const OnboardingScreen()
          : CashHelper.getData(key: 'token') != null
              ? const BottomNavBarScreen()
              : LoginScreen(),
      splash: SvgPicture.asset(
        AppImages.splashImage,
        /* width: 260.w,
        height: 263.h,
        fit: BoxFit.cover, */
      ),
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      //backgroundColor: AppColors.splashColor,
    );
  }
}
