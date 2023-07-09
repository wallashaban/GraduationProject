// ignore_for_file: use_build_context_synchronously

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../core/utils/exports.dart';

class SaveMedicalDetailsWidget extends StatefulWidget {
  final bool isRecorded;
  final TextEditingController medicineNameController;
  const SaveMedicalDetailsWidget({
    super.key,
    required this.isRecorded,
    required this.medicineNameController,
  });

  @override
  State<SaveMedicalDetailsWidget> createState() =>
      _SaveMedicalDetailsWidgetState();
}

class _SaveMedicalDetailsWidgetState extends State<SaveMedicalDetailsWidget> {
  //var user = Hive.box('UserDataCach').get('user');

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<MedicalCubit>(context);
    return CustomButton(
      text: widget.isRecorded ? AppStrings.edit : AppStrings.saveData,
      onPressed: () async {
        if (await AppConstants.checkConnectivity() == ConnectivityResult.none) {
          AppConstants.showSnackbar(
            context: context,
            content: AppStrings.noInternet,
          );
        } else {
          debugPrint('medicine name ${widget.medicineNameController.text}');
          widget.isRecorded
              ? cubit.updateMedicalDetails(
                  StoreMedicalDetailsParameters(
                    bloodType: cubit.bloodType ?? cubit.medical?.bloodType,
                    allergy: cubit.allergyValue ?? cubit.medical?.allergy,
                    chronicDisease: cubit.chronicDiseaseValue ??
                        cubit.medical?.chronicDisease,
                    genticDisease: cubit.isGeneticDisease == false
                        ? null
                        : cubit.geneticDiseaseValue ??
                            cubit.medical?.genticDisease,
                    isMedicine: cubit.isMedicine == true
                        ? widget.medicineNameController.text
                        : null,
                  ),
                )
              : cubit.storeMedicalDetails(
                  StoreMedicalDetailsParameters(
                    bloodType: cubit.bloodType,
                    allergy: cubit.allergyValue,
                    chronicDisease: cubit.chronicDiseaseValue,
                    genticDisease: cubit.geneticDiseaseValue,
                    isMedicine: widget.medicineNameController.text,
                  ),
                );
        }
      },
    );
  }
}
