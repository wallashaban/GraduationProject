import '../../../core/utils/exports.dart';

class CustomTextIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final dynamic onPressed;
  const CustomTextIconButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: ButtonStyle(
          iconColor: MaterialStatePropertyAll(AppColors.white),
          foregroundColor: MaterialStatePropertyAll(
            AppColors.white,
          ),
        ),
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 24.r,
        ),
        label: CustomText(
            text: text,
            color: AppColors.white,
            size: 12.sp,
            fontWeight: FontWeight.w600));
  }
}
