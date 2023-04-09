
import 'package:graduation_project/core/utils/exports.dart';


class BlockWidget extends StatelessWidget {
  final String text;
  final String image;
  final dynamic onTap;
  final bool isMedicalHealthRecord;
  const BlockWidget({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
    this.isMedicalHealthRecord=false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height:/* isMedicalHealthRecord?176.h: */ 164.h,
        width: /* isMedicalHealthRecord?160.w: */ 147.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: AppColors.darkColor,
                blurRadius: 5,
                blurStyle: BlurStyle.outer),
          ],
        ),
        child: Container(
          height: 154.h,
          width: 137.w,
          padding:  EdgeInsets.all(8.r),
          margin:  EdgeInsets.all(5.r),
          decoration: BoxDecoration(
            color: AppColors.appBarColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              CustomText(
                color: AppColors.darkColor,
                fontWeight: FontWeight.bold,
                size: 20.sp,
                text: text,
              ),
              const Spacer(),
              SvgPicture.asset(image),
            ],
          ),
        ),
      ),
    );
  }
}
