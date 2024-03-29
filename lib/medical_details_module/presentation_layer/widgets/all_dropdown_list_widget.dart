import 'package:graduation_project/core/utils/exports.dart';

import 'dropdown_list_widget.dart';

class AllDropdownListWidget extends StatelessWidget {
  final bool isRecorded;
 const AllDropdownListWidget({
    super.key,
    required this.isRecorded,
  });
  //var user = Hive.box('UserDataCach').get('user');
  @override
  Widget build(BuildContext context) {
    /*  var cubit.medical =
        Hive.box('userDataCach').get('medicalDetails${user.id}'); */
    var cubit = BlocProvider.of<MedicalCubit>(context);
    return Column(
      children: [
        CustomDropdownList(
          hint: AppStrings.bloodType,
          items: cubit.bloodTypes.map(AppConstants.buildMenuItem).toList(),
          onChanged: (bloodType) {
            //  debugPrint('gen ${cubit.medical.genticDisease}');
            cubit.changeBloodTypeValue(bloodType);
          },
          value: isRecorded && cubit.bloodType == null
              ? cubit.medical?.bloodType
              : cubit.bloodType,
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomDropdownList(
          hint: AppStrings.allergy,
          items: cubit.allergies.map(AppConstants.buildMenuItem).toList(),
          onChanged: (allergy) {
            cubit.changeAllergyValue(allergy);
          },
          value: isRecorded && cubit.allergyValue == null
              ? cubit.medical?.allergy
              : cubit.allergyValue,
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomDropdownList(
          hint: AppStrings.chronicDisease,
          items: cubit.chronicDiseaes.map(AppConstants.buildMenuItem).toList(),
          onChanged: (chronicDisease) {
            cubit.changeChronicDiseaseValue(chronicDisease);
          },
          value: isRecorded && cubit.chronicDiseaseValue == null
              ? cubit.medical?.chronicDisease
              : cubit.chronicDiseaseValue,
        ),
      ],
    );
  }
}
