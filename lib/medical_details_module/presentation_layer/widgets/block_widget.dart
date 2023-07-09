import '../../../core/utils/exports.dart';

class BlockWidget extends StatelessWidget {
  final String text;
  final String image;
  final dynamic onTap;
  final bool isMedicalHealthRecord;
  final double? width;
  final double? height;
  final double? imageWidth;
  final double? imageHeight;
  final double? textSize;
  const BlockWidget({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
    this.textSize,
    this.width,
    this.height,
    this.imageHeight,
    this.imageWidth,
    this.isMedicalHealthRecord = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: isMedicalHealthRecord ? 154.h : height,
        width: isMedicalHealthRecord ? 147.w : width,
        decoration: BoxDecoration(
          color: /* isMedicalHealthRecord ? */
              AppColors.white, //: AppColors.backColor,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[400]!,
                blurRadius: isMedicalHealthRecord ? 2 : 2,
                blurStyle: BlurStyle.outer),
          ],
        ),
        child: Container(
          height: 144.h,
          width: 137.w,
          padding: EdgeInsets.all(8.r),
          margin: EdgeInsets.all(5.r),
          decoration: BoxDecoration(
            color: AppColors.backColor,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Column(
            children: [
              CustomText(
                color: AppColors.appBarColor,
                fontWeight: FontWeight.w600,
                size: isMedicalHealthRecord ? 16.sp : textSize,
                text: text,
              ),
              const Spacer(),
              SvgPicture.asset(
                image,
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
