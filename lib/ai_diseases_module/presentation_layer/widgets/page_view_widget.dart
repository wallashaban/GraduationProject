// ignore_for_file: must_be_immutable

import 'package:graduation_project/ai_diseases_module/presentation_layer/widgets/second_instruction_widget.dart';

import '../../../core/utils/exports.dart';
import 'first_instruction_widget.dart';

class PageviewWidget extends StatelessWidget {
  final String field;

  PageviewWidget({
    super.key,
    required this.field,
  });
  var pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 405.h,
          child: PageView(
            reverse: true,
            controller: pageController,
            onPageChanged: (value) {
              debugPrint('index ${value.toString()}');
            },
            children: const [
              FirstInstructionWidget(),
              SecondInstructionWidget(),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomButton(
          text: AppStrings.next,
          onPressed: () {
            debugPrint('hola');
            if (pageController.page == 1) {
              CashHelper.saveData(key: 'visited', value: true);
              AppConstants.navigateReplacement(
                context: context,
                routeName: AppRoutes.uploadPhotoOfDiseaseScreen,
                arguments: field,
              );
            }
            pageController.animateToPage(
              1,
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
            );
          },
        ),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
