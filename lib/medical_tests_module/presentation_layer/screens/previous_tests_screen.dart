// ignore_for_file: unused_local_variable, unnecessary_string_interpolations

import 'package:graduation_project/authentication_module/presentaion_layer/widgets/cutom_circular.dart';
import 'package:graduation_project/core/caching_data/test_cach.dart';
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
    TestsParameters testsParameters = TestsParameters(
      isEdit: false,
    );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: AppStrings.prevTest,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: BlocConsumer<MedicalTestsCubit, MedicalTestsState>(
            listener: (context, state) {},
            builder: (context, state) {
              return SingleChildScrollView(
                child: ValueListenableBuilder(
                  valueListenable: Hive.box('testCach').listenable(),
                  builder: (context, value, child) {
                    List<TestCach> dataa = [];

                    /* final data = */ value.values.map((e) {
                      if (e.key
                          .split(' ')
                          .last
                          .contains(CashHelper.getData(key: 'id').toString())) {
                        dataa += [e];
                      }
                    }).toList();
                    debugPrint('data ${dataa.length}');
                    debugPrint('idd ${CashHelper.getData(key: 'id')}');
                    if (dataa.isEmpty) {
                      return NoDataWidget(
                        text: AppStrings.noTests,
                        image: AppImages.noTestsImage,
                        textButton: AppStrings.addNewRecord,
                        screen: AppRoutes.newTestScreen,
                        arguments: testsParameters,
                      );
                    } else {
                      return Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: dataa.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  TestsParameters toothParameters =
                                      TestsParameters(
                                          isEdit: true,
                                          medicalTests: dataa[index]);
                                  AppConstants.navigateTo(
                                    context: context,
                                    routeName: AppRoutes.addToothScreen,
                                    arguments: toothParameters,
                                  );
                                },
                                child: TestsPrescriptionBlock(
                                  model: dataa[index],
                                  isPrescription: false,
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0.r),
                            child: CustomButton(
                              text: AppStrings.addNewTest,
                              onPressed: () {
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
                        ],
                      );
                    }
                  },
                ),
              );
            }),
      ),
    );
  }
}
