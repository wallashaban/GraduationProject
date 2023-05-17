import '../../../core/utils/exports.dart';

class InstructionWidget extends StatelessWidget {
  final String text;
  const InstructionWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (text != AppStrings.advice1)
          Icon(
            Icons.star,
            color: AppColors.black,
            size: 10.r,
          ),
        SizedBox(
          width: 3.w,
        ),
        CustomText(
          text: text,
          size: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
