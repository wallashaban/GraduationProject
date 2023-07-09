import 'package:graduation_project/core/utils/exports.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: AppStrings.aboutApp,
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
            padding: EdgeInsets.only(
              top: 32.h,
              left: 24.w,
              right: 24.w,
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  AppImages.splashImage,
                ),
                SizedBox(
                  height: 32.h,
                ),
                CustomText(
                  text: AppStrings.about,
                  size: 14.sp,
                  maxLines: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
