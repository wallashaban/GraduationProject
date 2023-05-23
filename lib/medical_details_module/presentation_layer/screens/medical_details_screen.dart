// ignore_for_file: must_be_immutable

import '../../../authentication_module/presentaion_layer/widgets/radio_widget.dart';
import '../../../core/utils/exports.dart';
import '../widgets/all_dropdown_list_widget.dart';
import '../widgets/dropdown_list_widget.dart';
import '../widgets/save_medical_details_widget.dart';

class MedicalDetailsScreen extends StatelessWidget {
  MedicalDetailsScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var medicineNameController = TextEditingController();
  bool isLoading = false;
  var medicalSetails = Hive.box('userDataCach').get('medicalDetails');
  bool isRecorded = CashHelper.getData(key: 'medicalDetailsRecorded') == true;
  @override
  Widget build(BuildContext context) {
    if (isRecorded) {
      medicineNameController.text = medicalSetails.medicineFile ?? '';
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              )),
          title: CustomText(
            text: AppStrings.medicalDetails,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: BlocConsumer<MedicalCubit, MedicalState>(
                listener: (context, state) {
                  if (state is StoreMedicalDetailsErrorState) {
                    AppConstants.showSnackbar(
                      context: context,
                      content: state.error,
                    );
                  }
                  if (state is UpdateMedicalDetailsSuccessState) {
                    AppConstants.showSnackbar(
                      context: context,
                      content: AppStrings.saveSuccess,
                    );
                  }
                  if (state is StoreMedicalDetailsSuccessState) {
                    AppConstants.showSnackbar(
                      context: context,
                      content: AppStrings.saveSuccess,
                    );
                  }
                },
                builder: (context, state) {
                  var cubit = BlocProvider.of<MedicalCubit>(context);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    AllDropdownListWidget(isRecorded:isRecorded),
                     SizedBox(
                        height: 15.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: CustomText(
                          text: AppStrings.haveMedicine,
                          color: AppColors.appBarColor,
                          size: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: Row(
                          children: [
                            RadioWidget(
                                groupValue:
                                    isRecorded && cubit.isMedicine == null
                                        ? (medicalSetails.isMedicine == true
                                            ? AppStrings.yes
                                            : AppStrings.no)
                                        : (cubit.isMedicine == true
                                            ? AppStrings.yes
                                            : AppStrings.no),
                                onChanged: (value) {
                                  if (value == 'لا') {
                                    cubit.existMedicineOrNot(false);
                                  } else {
                                    cubit.existMedicineOrNot(true);
                                  }
                                },
                                text: AppStrings.yes,
                                value: AppStrings.yes),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            RadioWidget(
                                groupValue:
                                    isRecorded && cubit.isMedicine == null
                                        ? (medicalSetails.isMedicine == true
                                            ? AppStrings.yes
                                            : AppStrings.no)
                                        : (cubit.isMedicine == true
                                            ? AppStrings.yes
                                            : AppStrings.no),
                                onChanged: (value) {
                                  debugPrint(
                                      'value ${medicalSetails.medicineFile}');
                                  if (value == 'لا') {
                                    cubit.existMedicineOrNot(false);
                                  } else {
                                    cubit.existMedicineOrNot(true);
                                  }
                                },
                                text: AppStrings.no,
                                value: AppStrings.no),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      if (cubit.isMedicine == true)
                        CustomTextFormField(
                          controller: medicineNameController,
                          obscureText: false,
                          labelText: AppStrings.medicineName,
                          validator: (value) {},
                        ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: CustomText(
                          text: AppStrings.haveGeneticDisease,
                          color: AppColors.appBarColor,
                          size: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: Row(
                          children: [
                            RadioWidget(
                                groupValue:
                                    isRecorded && cubit.isGeneticDisease == null
                                        ? (medicalSetails.genticDisease == true
                                            ? AppStrings.yes
                                            : AppStrings.no)
                                        : (cubit.isGeneticDisease == true
                                            ? AppStrings.yes
                                            : AppStrings.no),
                                onChanged: (value) {
                                  debugPrint(
                                      'geni ${medicalSetails.isGenticDisease}');
                                  if (value == 'لا') {
                                    cubit.existGeneticDiseaseOrNot(false);
                                  } else {
                                    cubit.existGeneticDiseaseOrNot(true);
                                  }
                                },
                                text: AppStrings.yes,
                                value: AppStrings.yes),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            RadioWidget(
                                groupValue:
                                    isRecorded && cubit.isGeneticDisease == null
                                        ? (medicalSetails.genticDisease == true
                                            ? AppStrings.yes
                                            : AppStrings.no)
                                        : (cubit.isGeneticDisease == true
                                            ? AppStrings.yes
                                            : AppStrings.no),
                                onChanged: (value) {
                                  if (value == 'لا') {
                                    cubit.existGeneticDiseaseOrNot(false);
                                  } else {
                                    cubit.existGeneticDiseaseOrNot(true);
                                  }
                                },
                                text: AppStrings.no,
                                value: AppStrings.no),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      if (cubit.isGeneticDisease == true ||
                          (medicalSetails.isGenticDisease == true &&
                              cubit.isGeneticDisease == null))
                        CustomDropdownList(
                          hint: AppStrings.geneticDisease,
                          items: cubit.geneticDiseaes
                              .map(AppConstants.buildMenuItem)
                              .toList(),
                          onChanged: (geneticisease) {
                            cubit.changeGeneticDiseaseValue(geneticisease);
                            debugPrint(
                                'genetic ${medicalSetails.genticDisease}');
                          },
                          value: isRecorded && cubit.geneticDiseaseValue == null
                              ? medicalSetails.genticDisease
                              : cubit.geneticDiseaseValue,
                        ),
                      SizedBox(
                        height: 45.h,
                      ),
                      if (state is StoreMedicalDetailsLoadingState ||
                          state is UpdateMedicalDetailsLoadingState)
                        CustomButton(
                          isLoading: true,
                        )
                      else
                      SaveMedicalDetailsWidget(isRecorded: isRecorded,medicineNameController: medicineNameController,),
                         ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
