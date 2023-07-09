import 'package:dotted_border/dotted_border.dart';
import '../../../core/utils/exports.dart';

class TakePhotoWidget extends StatelessWidget {
  final bool isLoading;
  const TakePhotoWidget({super.key,this.isLoading=false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DottedBorder(
        color: AppColors.appBarColor,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
        borderType: BorderType.Circle,
        radius: Radius.circular(20.r),
        strokeWidth: 1.5,
        child: Container(
          margin: const EdgeInsets.all(2),
          width: 80.h,
          height: 60.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[400]!,
                  blurRadius: 2,
                  blurStyle: BlurStyle.outer),
            ],
            shape: BoxShape.circle,
            color: AppColors.appBarColor,
          ),
          child: Center(
            child: isLoading? CircularProgressIndicator(color: AppColors.white,):
             CustomText(
              text: AppStrings.diagnose,
              fontWeight: FontWeight.normal,
              size: 14.sp,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
