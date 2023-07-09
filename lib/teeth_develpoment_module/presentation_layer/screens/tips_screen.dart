import 'package:graduation_project/core/utils/exports.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              )),
          title: const CustomText(
            text: AppStrings.tips,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 32.h, left: 16.w, right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: AppStrings.intro,
                  size: 14.sp,
                  maxLines: 2,
                  fontWeight: FontWeight.w600,
                  color: AppColors.appBarColor,
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomText(
                  text: AppStrings.intro2,
                  size: 14.sp,
                  maxLines: 80,
                  color: AppColors.appBarColor,
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomText(
                  text: AppStrings.ques1,
                  size: 16.sp,
                  maxLines: 80,
                  color: AppColors.appBarColor,
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomText(
                  text: AppStrings.ans1,
                  size: 14.sp,
                  maxLines: 80,
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomText(
                  text: AppStrings.ques2,
                  size: 16.sp,
                  color: AppColors.appBarColor,
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomText(
                  text: AppStrings.ans2,
                  size: 14.sp,
                  maxLines: 80,
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomText(
                  text: AppStrings.ques3,
                  size: 16.sp,
                  color: AppColors.appBarColor,
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomText(
                  text: AppStrings.ans3,
                  size: 14.sp,
                  maxLines: 80,
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomText(
                  text: AppStrings.ques4,
                  size: 16.sp,
                  color: AppColors.appBarColor,
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomText(
                  text: AppStrings.ans4,
                  size: 14.sp,
                  maxLines: 80,
                ),
                SizedBox(
                  height: 8.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
