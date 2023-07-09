import 'package:graduation_project/core/utils/exports.dart';

class TeethMonthWidget extends StatelessWidget {
  final String letterText;
  final String monthText;
  const TeethMonthWidget({
    super.key,
    required this.letterText,
    required this.monthText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: '${AppStrings.month}  $monthText  ',
          size: 12.sp,
          color: AppColors.teethColor,
        ),
        SizedBox(
          width: 6.w,
        ),
        CircleAvatar(
          radius: 12.r,
          backgroundColor: AppColors.appBarColor.withOpacity(0.15),
          child: CustomText(
            text: letterText,
            size: 14.sp,
            color: AppColors.teethColor,
          ),
        ),
      ],
    );
  }
}
