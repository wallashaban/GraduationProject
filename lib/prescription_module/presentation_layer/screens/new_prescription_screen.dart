// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:graduation_project/core/caching_data/pres_cach.dart';
import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/prescription_module/domain_layer/entities/prescribtion.dart';

import '../../../medical_tests_module/presentation_layer/widgets/date_text_form_field.dart';
import '../widgets/custom_divider.dart';

class PresParameters {
  PresCach? presccription;
  bool isEdit;
  PresParameters({
    this.presccription,
    required this.isEdit,
  });
}

// ignore: must_be_immutable
class NewPrescriptionScreen extends StatelessWidget {
  final PresParameters presParameters;
  NewPrescriptionScreen({super.key, required this.presParameters});
  var noteController = TextEditingController();
  var labNameController = TextEditingController();
  var dateController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    if (presParameters.presccription != null) {
      noteController.text =
          presParameters.presccription!.note ?? 'لا توجد ملاحظات لعرضها';
      // labNameController.text = presccription!.;
      dateController.text = presParameters.presccription!.date;
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: AppStrings.newRogita,
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
            child: BlocConsumer<PrescriptionCubit, PrescriptionState>(
              listener: (context, state) {
                if (state is UpdatePrescriptionErrorState) {
                  AppConstants.showSnackbar(
                      context: context, content: state.error);
                }
                if (state is StorePrescriptionErrorState) {
                  AppConstants.showSnackbar(
                      context: context, content: state.error);
                }
               
                if (state is StorePrescriptionSuccessState) {
                  AppConstants.showSnackbar(
                      context: context, content: AppStrings.saveSuccess);
                }
                if (state is UpdatePrescriptionSuccessState) {
                  AppConstants.showSnackbar(
                      context: context, content: AppStrings.saveSuccess);
                }
              },
              builder: (context, state) {
                var cubit = BlocProvider.of<PrescriptionCubit>(context);
                return Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: CustomText(
                          text: AppStrings.rogitaDate,
                          color: AppColors.appBarColor,
                          size: 16.sp,
                          fontWeight: FontWeight.bold,
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
                        controller: noteController,
                        labelText: AppStrings.note,
                        obscureText: false,
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
                      const CustomDivider(),
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
                      SizedBox(
                        height: 20.h,
                      ),
                      if ((state is StorePrescriptionLoadingState) ||
                          (state is UpdatePrescriptionLoadingState))
                        CustomButton(
                          isLoading: true,
                        ),
                      if ((state is! StorePrescriptionLoadingState)&& 
                      (state is! UpdatePrescriptionLoadingState))
                        CustomButton(
                            text: presParameters.isEdit
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
                                if (presParameters.isEdit) {
                                  cubit.pickedFile == null
                                      ? cubit.updatePrescription(
                                          PresccriptionParameters(
                                              note: noteController.text,
                                              date: BlocProvider.of<
                                                          TeethDevelopmentCubit>(
                                                      context)
                                                  .date,
                                              id:
                                                  presParameters
                                                      .presccription!.id))
                                      : cubit.updatePrescription(
                                          PresccriptionParameters(
                                              note: noteController.text,
                                              date: BlocProvider.of<
                                                          TeethDevelopmentCubit>(
                                                      context)
                                                  .date,
                                              file: cubit.filePath,
                                              id: presParameters
                                                  .presccription!.id));
                                } else {
                                  cubit.storePrescription(
                                      PresccriptionParameters(
                                    note: noteController.text,
                                    date:
                                        BlocProvider.of<TeethDevelopmentCubit>(
                                                context)
                                            .date,
                                    file: cubit.filePath,
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
