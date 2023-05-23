import '../../../core/utils/exports.dart';

class SaveMedicalDetailsWidget extends StatelessWidget {
  final bool isRecorded;
 final TextEditingController medicineNameController;
  const SaveMedicalDetailsWidget({super.key,
  required this.isRecorded,
  required this.medicineNameController,});

  @override
  Widget build(BuildContext context) {
    var medicalSetails = Hive.box('userDataCach').get('medicalDetails');
    var cubit = BlocProvider.of<MedicalCubit>(context);
    return CustomButton(
      text: isRecorded ? AppStrings.edit : AppStrings.saveData,
      onPressed: () {
        debugPrint('medicine name ${medicineNameController.text}');
        isRecorded
            ? cubit.updateMedicalDetails(
                StoreMedicalDetailsParameters(
                  bloodType: cubit.bloodType ?? medicalSetails.bloodType,
                  allergy: cubit.allergyValue ?? medicalSetails.allergy,
                  chronicDisease: cubit.chronicDiseaseValue ??
                      medicalSetails.chronicDisease,
                  genticDisease: cubit.isGeneticDisease == false
                      ? null
                      : cubit.geneticDiseaseValue ??
                          medicalSetails.genticDisease,
                  isMedicine: null,
                  /* cubit.isMedicine ??
                                          medicalSetails.isMedicine, */
                  medicineName: medicineNameController.text,
                ),
              )
            : cubit.storeMedicalDetails(
                StoreMedicalDetailsParameters(
                  bloodType: cubit.bloodType,
                  allergy: cubit.allergyValue,
                  chronicDisease: cubit.chronicDiseaseValue,
                  genticDisease: cubit.geneticDiseaseValue,
                  isMedicine: cubit.isMedicine,
                  medicineName: medicineNameController.text,
                ),
              );
      },
    );
  }
}
