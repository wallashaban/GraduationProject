import 'package:animated_splash_screen/animated_splash_screen.dart';



import 'package:graduation_project/core/utils/exports.dart';

class SplashScreen extends StatelessWidget {
   const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: CashHelper.getData(key: 'token') != null
          ? const BottomNavBarScreen()
          : LoginScreen(),
      splash: Image.asset(
        'assets/images/splash.jpeg',
        width: 200.w,
        height: 600.h,
        fit: BoxFit.contain,
      ),
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: AppColors.splashColor,
    );
  }
}
