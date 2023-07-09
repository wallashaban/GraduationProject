import '../../../core/utils/exports.dart';
import 'advice_text_widget.dart';

class SecondInstructionWidget extends StatelessWidget {
  const SecondInstructionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 24.w,
      ),
      child: Column(
        children: [
          CustomText(
            text: AppStrings.please,
            size: 14.sp,
            fontWeight: FontWeight.w600,
          ),
          SvgPicture.asset(
            AppImages.cameraTakeImage,
            height: 220.h,
          ),
          SizedBox(
            height: 24.h,
          ),
          const InstructionWidget(
            text: AppStrings.advice1,
          ),
          SizedBox(
            height: 16.h,
          ),
          const InstructionWidget(
            text: AppStrings.advice2,
          ),
          SizedBox(
            height: 5.h,
          ),
          const InstructionWidget(
            text: AppStrings.advice3,
          ),
          SizedBox(
            height: 5.h,
          ),
          const InstructionWidget(
            text: AppStrings.advice4,
          ),
          SizedBox(
            height: 5.h,
          ),
          const InstructionWidget(
            text: AppStrings.advice5,
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
