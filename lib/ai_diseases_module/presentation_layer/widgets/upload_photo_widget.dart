import '../../../core/utils/exports.dart';

class UploadPhotoWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final dynamic onTap;
  const UploadPhotoWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // margin: EdgeInsets.symmetric(vertical: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        width: 80.w,
        height: 80.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(100.r),
          color: AppColors.borderColor.withOpacity(0.15),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.darkColor.withOpacity(0.8),
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomText(
              color: AppColors.darkColor.withOpacity(0.8),
              size: 12.sp,
              text: text,
            ),
          ],
        ),
      ),
    );
  }
}
