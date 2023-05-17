// ignore_for_file: must_be_immutable

import '../../../authentication_module/presentaion_layer/widgets/radio_widget.dart';
import '../../../core/utils/exports.dart';
import '../widgets/dropdown_list_widget.dart';

class MedicalDetailsScreen extends StatelessWidget {
  MedicalDetailsScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var medicineNameController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
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

                  if (state is StoreMedicalDetailsLoadingState) {
                    isLoading = true;
                  } else {
                    isLoading = false;
                  }
                  if (state is StoreMedicalDetailsSuccessState) {
                    AppConstants.showSnackbar(
                      context: context,
                      content: BlocProvider.of<MedicalCubit>(context)
                          .medicalDetails
                          .message,
                    );
                  }
                },
                builder: (context, state) {
                  var cubit = BlocProvider.of<MedicalCubit>(context);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDropdownList(
                        hint: AppStrings.bloodType,
                        items: cubit.bloodTypes
                            .map(AppConstants.buildMenuItem)
                            .toList(),
                        onChanged: (bloodType) {
                          cubit.changeBloodTypeValue(bloodType);
                        },
                        value: cubit.bloodType,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomDropdownList(
                        hint: AppStrings.allergy,
                        items: cubit.allergies
                            .map(AppConstants.buildMenuItem)
                            .toList(),
                        onChanged: (allergy) {
                          cubit.changeAllergyValue(allergy);
                        },
                        value: cubit.allergyValue,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomDropdownList(
                        hint: AppStrings.chronicDisease,
                        items: cubit.chronicDiseaes
                            .map(AppConstants.buildMenuItem)
                            .toList(),
                        onChanged: (chronicDisease) {
                          cubit.changeChronicDiseaseValue(chronicDisease);
                        },
                        value: cubit.chronicDiseaseValue,
                      ),
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
                                groupValue: cubit.isMedicine,
                                onChanged: (value) {
                                  cubit.existMedicineOrNot(value);
                                },
                                text: AppStrings.yes,
                                value: AppStrings.yes),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            RadioWidget(
                                groupValue: cubit.isMedicine,
                                onChanged: (value) {
                                  cubit.existMedicineOrNot(value);
                                },
                                text: AppStrings.no,
                                value: AppStrings.no),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      if (cubit.isMedicine == AppStrings.yes)
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
                                groupValue: cubit.isGeneticDisease,
                                onChanged: (value) {
                                  cubit.existGeneticDiseaseOrNot(value);
                                },
                                text: AppStrings.yes,
                                value: AppStrings.yes),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            RadioWidget(
                                groupValue: cubit.isGeneticDisease,
                                onChanged: (value) {
                                  cubit.existGeneticDiseaseOrNot(value);
                                },
                                text: AppStrings.no,
                                value: AppStrings.no),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      if (cubit.isGeneticDisease == AppStrings.yes)
                        CustomDropdownList(
                          hint: AppStrings.geneticDisease,
                          items: cubit.geneticDiseaes
                              .map(AppConstants.buildMenuItem)
                              .toList(),
                          onChanged: (geneticisease) {
                            cubit.changeGeneticDiseaseValue(geneticisease);
                          },
                          value: cubit.geneticDiseaseValue,
                        ),
                      SizedBox(
                        height: 45.h,
                      ),
                      CustomButton(
                        text: AppStrings.saveData,
                        isLoading: isLoading,
                        onPressed: () {
                          cubit.storeMedicalDetails(
                            StoreMedicalDetailsParameters(
                              bloodType: cubit.bloodType,
                              allergy: cubit.allergyValue,
                              chronicDisease: cubit.chronicDiseaseValue,
                              genticDisease: cubit.geneticDiseaseValue,
                              isMedicine: cubit.isMedicine == AppStrings.yes
                                  ? true
                                  : false,
                              medicineName: medicineNameController,
                            ),
                          );
                        },
                      )
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
