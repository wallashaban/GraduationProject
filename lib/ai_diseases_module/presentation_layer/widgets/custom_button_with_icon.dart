import '../../../core/utils/exports.dart';

class CustomButtonWithIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final dynamic onPressed;
  const CustomButtonWithIcon({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        width: 110.w,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
          ),
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: AppColors.white,
          ),
          label: CustomText(
            text: text,
            size: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
