import 'package:animated_splash_screen/animated_splash_screen.dart';

import '../../../core/utils/exports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 260.w,
      nextScreen: CashHelper.getData(key: 'token') != null
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
