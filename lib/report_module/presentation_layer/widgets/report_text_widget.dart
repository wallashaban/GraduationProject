import '../../../core/utils/exports.dart';

class ReportTextWidget extends StatelessWidget {
  final String text;
  const ReportTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: AppColors.backColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
          boxShadow: [
            BoxShadow(
                color: AppColors.appBarColor.withOpacity(0.45),
                blurRadius: 5,
                blurStyle: BlurStyle.outer),
          ],
        ),
        child: CustomText(
          text: text,
          color: AppColors.textColor,
          size: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
