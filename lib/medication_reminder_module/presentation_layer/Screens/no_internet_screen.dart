import 'package:graduation_project/core/utils/exports.dart';
import 'package:lottie/lottie.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Lottie.asset(
            AppImages.noInternetImage,
            height: MediaQuery.of(context).size.height * 0.6,
            //width: MediaQuery.of(context).size.width * 0.6,
          ),
        ),
      )),
    );
  }
}
