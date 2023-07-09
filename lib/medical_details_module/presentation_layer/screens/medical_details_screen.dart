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

  bool isRecorded =
      Hive.box('userDataCach').get('medicalDetails${userDataCach.id}') != null;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<MedicalCubit>(context);
    debugPrint('statement ${cubit.medical?.allergy}');
    if (isRecorded) {
      medicineNameController.text = cubit.medical?.medicineFile ?? '';
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: WillPopScope(
        onWillPop: () async {
          bool willPPop = true;
          var cubit = BlocProvider.of<MedicalCubit>(context);
          cubit.allergyValue = cubit.bloodType =
              cubit.chronicDiseaseValue = cubit.geneticDiseaseValue = null;
          return willPPop;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () async {
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
                    if ((state is StoreMedicalDetailsErrorState)) {
                      AppConstants.showSnackbar(
                        context: context,
                        content: state.error,
                      );
                    }
                    if ((state is UpdateMedicalDetailsErrorState)) {
                      AppConstants.showSnackbar(
                        context: context,
                        content: state.error,
                      );
                    }

                    if ((state is StoreMedicalDetailsSuccessState) ||
                        (state is UpdateMedicalDetailsSuccessState)) {
                      AppConstants.showSnackbar(
                        context: context,
                        content: AppStrings.saveSuccess,
                      );
                    }
                  },
                  builder: (context, state) {
                    var cubit = BlocProvider.of<MedicalCubit>(context);

                    return Padding(
                      padding: EdgeInsets.only(top: 8.h, left: 16, right: 8.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AllDropdownListWidget(isRecorded: isRecorded),
                          SizedBox(
                            height: 15.h,
                          ),
                          CustomText(
                            text: AppStrings.haveMedicine,
                            color: AppColors.black,
                            size: 14.sp,
                            fontWeight: FontWeight.normal,
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
                                            ? (cubit.medical?.isMedicine == true
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                RadioWidget(
                                    groupValue: isRecorded &&
                                            cubit.isMedicine == null
                                        ? (cubit.medical?.isMedicine != null
                                            ? cubit.medical.isMedicine == true
                                                ? AppStrings.yes
                                                : AppStrings.no
                                            : AppStrings.no)
                                        : (cubit.isMedicine == true
                                            ? AppStrings.yes
                                            : AppStrings.no),
                                    onChanged: (value) {
                                      /* debugPrint(
                                          'value ${cubit.medical.medicineFile}'); */
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
                            height: 16.h,
                          ),
                          if (cubit.isMedicine == true ||
                              (isRecorded &&
                                  cubit.medical?.isMedicine == true &&
                                  cubit.isMedicine == null))
                            CustomTextFormField(
                              controller: medicineNameController,
                              obscureText: false,
                              labelText: AppStrings.medicineName,
                              validator: (value) {},
                            ),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomText(
                            text: AppStrings.haveGeneticDisease,
                            color: AppColors.black,
                            size: 14.sp,
                            fontWeight: FontWeight.normal,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20.w),
                            child: Row(
                              children: [
                                RadioWidget(
                                    groupValue: isRecorded &&
                                            cubit.isGeneticDisease == null
                                        ? (cubit.medical?.isGenticDisease ==
                                                true
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
                                    text: AppStrings.yes,
                                    value: AppStrings.yes),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                RadioWidget(
                                    groupValue: isRecorded &&
                                            cubit.isGeneticDisease == null
                                        ? (cubit.medical?.isGenticDisease ==
                                                true
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
                              (isRecorded &&
                                  cubit.medical?.isGenticDisease == true &&
                                  cubit.isGeneticDisease == null))
                            CustomDropdownList(
                              hint: AppStrings.geneticDisease,
                              items: cubit.geneticDiseaes
                                  .map(AppConstants.buildMenuItem)
                                  .toList(),
                              onChanged: (geneticisease) {
                                cubit.changeGeneticDiseaseValue(geneticisease);
                                /*  debugPrint(
                                    'genetic ${cubit.medical.genticDisease}'); */
                              },
                              value: isRecorded &&
                                      cubit.geneticDiseaseValue == null
                                  ? cubit.medical?.genticDisease
                                  : cubit.geneticDiseaseValue,
                            ),
                          SizedBox(
                            height: 32.h,
                          ),
                          if ((state is StoreMedicalDetailsLoadingState) ||
                              (state is UpdateMedicalDetailsLoadingState))
                            CustomButton(
                              isLoading: true,
                            )
                          else
                            SaveMedicalDetailsWidget(
                              isRecorded: isRecorded,
                              medicineNameController: medicineNameController,
                            ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
