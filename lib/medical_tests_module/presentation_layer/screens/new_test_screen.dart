// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:graduation_project/core/caching_data/test_cach.dart';
import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/medical_tests_module/presentation_layer/controllers/medical_tests_state.dart';

import '../widgets/date_text_form_field.dart';

class TestsParameters {
  TestCach? medicalTests;
  bool isEdit;
  TestsParameters({
    this.medicalTests,
    required this.isEdit,
  });
}

// ignore: must_be_immutable
class NewTestScreen extends StatelessWidget {
  final TestsParameters testsParameters;
  NewTestScreen({super.key, required this.testsParameters});
  var testTypeController = TextEditingController();
  var labNameController = TextEditingController();
  var dateController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if (testsParameters.medicalTests != null) {
      testTypeController.text = testsParameters.medicalTests!.type;
      labNameController.text = testsParameters.medicalTests!.labName;
      dateController.text = testsParameters.medicalTests!.labDate;
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: AppStrings.newTest,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: BlocConsumer<MedicalTestsCubit, MedicalTestsState>(
              listener: (context, state) {
                if (state is UpdateMedicaltestErrorState) {
                  AppConstants.showSnackbar(
                      context: context, content: state.error);
                }
                if (state is StoreMedicaltestErrorState) {
                  AppConstants.showSnackbar(
                      context: context, content: state.error);
                }

                if (state is StoreMedicaltestSuccessState) {
                  AppConstants.showSnackbar(
                      context: context, content: AppStrings.saveSuccess);
                }
                if (state is UpdateMedicaltestSuccessState) {
                  AppConstants.showSnackbar(
                      context: context, content: AppStrings.saveSuccess);
                }
              },
              builder: (context, state) {
                var cubit = BlocProvider.of<MedicalTestsCubit>(context);
                return Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: CustomText(
                          text: AppStrings.testDate,
                          color: AppColors.appBarColor,
                          fontWeight: FontWeight.bold,
                          size: 16.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const DateTextFormField(),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        controller: testTypeController,
                        labelText: AppStrings.testType,
                        obscureText: false,
                        validator: (value) {},
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        controller: labNameController,
                        obscureText: false,
                        labelText: AppStrings.labName,
                        validator: (value) {},
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      if (cubit.pickedFile != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              AppImages.cameraImage,
                              width: 60.w,
                              height: 80.h,
                            ),
                            IconButton(
                              onPressed: () {
                                cubit.canselPickedFile();
                              },
                              icon: Icon(
                                Icons.delete_outline,
                                color: AppColors.appBarColor,
                              ),
                            ),
                          ],
                        ),
                      Divider(
                        color: AppColors.borderColor,
                        height: 15.h,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                      ),
                      if (cubit.pickedFile == null)
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                cubit.pickImage();
                              },
                              icon: Icon(
                                Icons.camera_alt_sharp,
                                color: AppColors.appBarColor,
                              ),
                            ),
                          ],
                        ),
                      if ((state is StoreMedicaltestLoadingState) ||
                          (state is UpdateMedicaltestLoadingState))
                        CustomButton(
                          isLoading: true,
                        ),
                      if ((state is! StoreMedicaltestLoadingState) &&
                          (state is! UpdateMedicaltestLoadingState))
                        CustomButton(
                            text: testsParameters.isEdit
                                ? AppStrings.edit
                                : AppStrings.saveData,
                            onPressed: () async {
                              if (await AppConstants.checkConnectivity() ==
                                  ConnectivityResult.none) {
                                AppConstants.showSnackbar(
                                  context: context,
                                  content: AppStrings.noInternet,
                                );
                              } else if (formkey.currentState!.validate()) {
                                if (testsParameters.isEdit) {
                                  if (cubit.pickedFile == null) {
                                    cubit.updateMedicalTests(
                                      MediaclTestParameters(
                                        labName: labNameController.text,
                                        type: testTypeController.text,
                                        labDate: BlocProvider.of<
                                                TeethDevelopmentCubit>(context)
                                            .date,
                                        id: testsParameters.medicalTests!.id,
                                      ),
                                    );
                                  } else {
                                    cubit.updateMedicalTests(
                                      MediaclTestParameters(
                                        labName: labNameController.text,
                                        type: testTypeController.text,
                                        labDate: BlocProvider.of<
                                                TeethDevelopmentCubit>(context)
                                            .date,
                                        labFile: cubit.filePath,
                                        id: testsParameters.medicalTests!.id,
                                      ),
                                    );
                                  }
                                } else {
                                  cubit.storeMedicalTest(
                                    MediaclTestParameters(
                                      labName: labNameController.text,
                                      type: testTypeController.text,
                                      labDate: BlocProvider.of<
                                              TeethDevelopmentCubit>(context)
                                          .date,
                                      labFile: cubit.filePath,
                                    ),
                                  );
                                }
                              }
                            }),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        //),
        //   },
      ),
    );
  }
}
