import 'package:graduation_project/core/utils/exports.dart';

class NoNotificationWidget extends StatelessWidget {
  const NoNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.notificationImage,
            height: 82.h,
            width: 74.w,
          ),
          SizedBox(
            height: 40.h,
          ),
          CustomText(
            text: AppStrings.noNotification,
            color: AppColors.appBarColor.withOpacity(0.6),
            size: 16.sp,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 17.h,
          ),
          CustomText(
            text: AppStrings.noNoti,
            color: AppColors.appBarColor.withOpacity(0.6),
            size: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
