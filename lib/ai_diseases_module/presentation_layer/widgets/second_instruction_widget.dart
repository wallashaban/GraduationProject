import '../../../core/utils/exports.dart';
import 'advice_text_widget.dart';

class SecondInstructionWidget extends StatelessWidget {
  const SecondInstructionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.r),
      child: Column(
        children: [
          SvgPicture.asset(
            AppImages.cameraTakeImage,
          ),
          SizedBox(
            height: 30.h,
          ),
          const InstructionWidget(
            text: AppStrings.advice1,
          ),
          SizedBox(
            height: 20.h,
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
