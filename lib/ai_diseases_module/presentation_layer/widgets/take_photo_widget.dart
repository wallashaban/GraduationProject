import 'package:dotted_border/dotted_border.dart';
import '../../../core/utils/exports.dart';

class TakePhotoWidget extends StatelessWidget {
  const TakePhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DottedBorder(
        color: AppColors.darkColor,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
        borderType: BorderType.RRect,
        radius: Radius.circular(100.r),
        child: 
        Container(
          // margin: EdgeInsets.symmetric(vertical: 5.h),
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
          width: 160.w,
          height: 160.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(100.r),
            color: AppColors.borderColor.withOpacity(0.15),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.camera_alt_outlined,
                color: AppColors.darkColor,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomText(
                color: AppColors.darkColor,
                size: 14.sp,
                text: AppStrings.pressHere,
                maxLines: 2,
              ),
              CustomText(
                color: AppColors.darkColor,
                size: 14.sp,
                text: AppStrings.takePhoto,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
