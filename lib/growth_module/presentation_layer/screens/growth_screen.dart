// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:graduation_project/core/caching_data/growth_cach.dart';
import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/growth_module/domain_layer/entities/growth.dart';
import 'package:graduation_project/growth_module/presentation_layer/widgets/reminder_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../medical_tests_module/presentation_layer/widgets/date_text_form_field.dart';

class GrowParameters {
  GrowrhCach? growth;
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
            padding: EdgeInsets.only(top: 32.h, left: 32.w, right: 24.w),
            child: BlocConsumer<GrowthCubit, GrowthState>(
              listener: (context, state) async {
                if ((state is ClaculateGrowthErrorSatate)) {
                  if (state.error == 'هذا الوزن لا يتوافق مع المعدل الطبيعي') {
                    await showReminder(context);
                  } else {
                    AppConstants.showSnackbar(
                        context: context, content: state.error);
                  }
                }
                if ((state is EditGrowthErrorSatate)) {
                  if (state.error == 'هذا الوزن لا يتوافق مع المعدل الطبيعي') {
                    await showReminder(context);
                  } else {
                    AppConstants.showSnackbar(
                        context: context, content: state.error);
                  }
                }
                if (state is ClaculateGrowthSuccessSatate) {
                  AppConstants.showSnackbar(
                      context: context, content: AppStrings.saveSuccess);
                }
                if (state is EditGrowthSuccessSatate) {
                  AppConstants.showSnackbar(
                      context: context, content: AppStrings.saveSuccess);
                }
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
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      const DateTextFormField(),
                      SizedBox(
                        height: 24.h,
                      ),
                      CustomTextFormField(
                        controller: weightController,
                        labelText: AppStrings.weightKg,
                        keyBoardType: TextInputType.number,
                        obscureText: false,
                        validator: (value) {},
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        controller: heightController,
                        labelText: AppStrings.heghtCm,
                        keyBoardType: TextInputType.number,
                        obscureText: false,
                        validator: (value) {},
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      TextButton(
                          onPressed: () async {
                            final Uri uri = Uri.parse(
                             'https://youtu.be/U5S8dzs7hSs',
                              //scheme: 'https',
                              // host: 'https://youtu.be/U5S8dzs7hSs',
                            );
                            //if(! await launchUrl(uri,mode: LaunchMode.externalApplication,))

                            await launchUrl(
                              uri,
                              mode: LaunchMode.externalApplication,
                            );
                          },
                          child: CustomText(
                            text: AppStrings.video,
                            size: 16.sp,
                            color: AppColors.appBarColor,
                          )),
                      SizedBox(
                        height: 32.h,
                      ),
                      if ((state is ClaculateGrowthLoadingSatate) ||
                          (state is EditGrowthLoadingSatate))
                        CustomButton(
                          isLoading: true,
                        ),
                      if ((state is! ClaculateGrowthLoadingSatate) &&
                          (state is! EditGrowthLoadingSatate))
                        CustomButton(
                            text: growParameters.isEdit
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
                                if (growParameters.isEdit) {
                                  cubit.editeGrowth(
                                    GrowthParameters(
                                      height:
                                          double.parse(heightController.text),
                                      weight:
                                          double.parse(weightController.text),
                                      measureDate: BlocProvider.of<
                                              TeethDevelopmentCubit>(context)
                                          .date,
                                      id: growParameters.growth!.id,
                                    ),
                                  );
                                } else {
                                  cubit.calculateGrowth(GrowthParameters(
                                    measureDate:
                                        BlocProvider.of<TeethDevelopmentCubit>(
                                                context)
                                            .date,
                                    weight: double.parse(weightController.text),
                                    height: double.parse(heightController.text),
                                  ));
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
