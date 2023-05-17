// ignore_for_file: unused_local_variable, unnecessary_string_interpolations

import 'package:graduation_project/authentication_module/presentaion_layer/widgets/cutom_circular.dart';
import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/medical_tests_module/presentation_layer/controllers/medical_tests_state.dart';
import 'package:graduation_project/medical_tests_module/presentation_layer/screens/new_test_screen.dart';
import 'package:graduation_project/prescription_module/presentation_layer/widgets/no_data_widget.dart';

import '../widgets/tests_prescription_block.dart';

class PreviousTestsScreen extends StatelessWidget {
  const PreviousTestsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<MedicalTestsCubit>(context);
    bool isLoading = false;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: AppStrings.prevTest,
          ),
          leading: const Icon(
            Icons.arrow_back,
          ),
        ),
        body: BlocConsumer<MedicalTestsCubit, MedicalTestsState>(
            listener: (context, state) {
          if (state is GellAllMedicaltestLoadingState) {
            isLoading = true;
          } else {
            isLoading = false;
          }
        }, builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                isLoading
                    ? const CustomCircularProgress()
                    : cubit.allMedicalTests.isEmpty
                        ? const NoDataWidget(text: AppStrings.noTests,image: AppImages.developImage,)
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              if (cubit.allMedicalTests.isEmpty) {
                                return const NoDataWidget(
                                    text: AppStrings.noTests,image: AppImages.developImage,);
                              }
                              return TestsPrescriptionBlock(
                                model: cubit.allMedicalTests[index],
                                isPrescription: false,
                              );
                            },
                            itemCount: cubit.allMedicalTests.length,
                          ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0.r),
                    child: CustomButton(
                      text: AppStrings.addNewTest,
                      onPressed: () {
                        TestsParameters testsParameters = TestsParameters(
                          isEdit: false,
                        );
                        AppConstants.navigateTo(
                          arguments: testsParameters,
                          context: context,
                          routeName: AppRoutes.newTestScreen,
                        );
                      },
                      color: AppColors.textColor,
                      size: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
