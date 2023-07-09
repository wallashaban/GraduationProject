import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:graduation_project/authentication_module/presentaion_layer/screens/on_boarding_screen.dart';
import 'package:lottie/lottie.dart';

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
      splash: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            AppImages.splashImage,
          ),
          Lottie.asset(
            AppImages.splashAnimationImage,
            //height: MediaQuery.of(context).size.height * 0.6,
            //width: MediaQuery.of(context).size.width * 0.6,
          ),
        ],
      ),
      /* SvgPicture.asset(
        AppImages.splashImage,
        /* width: 260.w,
        height: 263.h,
        fit: BoxFit.cover, */
      ), */
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,

      //backgroundColor: AppColors.splashColor,
    );
  }
}
