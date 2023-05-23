// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/growth_module/domain_layer/entities/growth.dart';
import 'package:graduation_project/growth_module/presentation_layer/controllers/growth_cubit.dart';
import 'package:graduation_project/growth_module/presentation_layer/widgets/reminder_widget.dart';

import '../../../medical_tests_module/presentation_layer/widgets/date_text_form_field.dart';

class GrowParameters {
  Growth? growth;
  bool isEdit;
  GrowParameters({
    this.growth,
    required this.isEdit,
  });
}

// ignore: must_be_immutable
class GrowthScreen extends StatelessWidget {
  final GrowParameters growParameters;
  GrowthScreen({super.key, required this.growParameters});
  var weightController = TextEditingController();
  var heightController = TextEditingController();
  var dateController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    if (growParameters.growth != null) {
      weightController.text = growParameters.growth!.weight.toString();
      heightController.text = growParameters.growth!.height.toString();
      dateController.text = growParameters.growth!.measureDate.toString();
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: AppStrings.growthRecord,
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
            child: BlocConsumer<GrowthCubit, GrowthState>(
              listener: (context, state) async {
                if (state is ClaculateGrowthErrorSatate) {
                  if (state.error == 'هذا الوزن لا يتوافق مع المعدل الطبيعي') {
                    await showReminder(context);
                  } else {
                    AppConstants.showSnackbar(
                        context: context, content: state.error);
                  }
                }
                /* if (state is ClaculateGrowthErrorSatate) {
                  AppConstants.showSnackbar(
                      context: context, content: state.error);
                } */
                if (state is ClaculateGrowthLoadingSatate) {
                  isLoading = true;
                } else {
                  isLoading = false;
                }
                if (state is ClaculateGrowthSuccessSatate) {
                  AppConstants.showSnackbar(
                      context: context, content: AppStrings.saveSuccess);
                }
               /*  if (state is UpdatePrescriptionSuccessState) {
                  AppConstants.showSnackbar(
                      context: context, content: AppStrings.saveSuccess);
                } */
              },
              builder: (context, state) {
                var cubit = BlocProvider.of<GrowthCubit>(context);
                return Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: CustomText(
                          text: AppStrings.measureDate,
                          color: AppColors.appBarColor,
                          size: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      DateTextFormField(
                        controller: dateController,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        controller: weightController,
                        labelText: AppStrings.weightKg,
                        obscureText: false,
                        validator: (value) {},
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        controller: heightController,
                        labelText: AppStrings.heghtCm,
                        obscureText: false,
                        validator: (value) {},
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomText(
                        text: AppStrings.video,
                        size: 16.sp,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomButton(
                          isLoading: isLoading,
                          size: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                          text: growParameters.isEdit
                              ? AppStrings.edit
                              : AppStrings.saveData,
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              /* if (growParameters.isEdit) {
                               cubit.updatePrescription(
                                        PresccriptionParameters(
                                            note: noteController.text,
                                            date: dateController.text,
                                            file: cubit.filePath,
                                            id: presParameters
                                                .presccription!.id));
                              } else { */

                              cubit.calculateGrowth(GrowthParameters(
                                measureDate: dateController.text,
                                weight: double.parse(weightController.text),
                                height: double.parse(heightController.text),
                              ));
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
