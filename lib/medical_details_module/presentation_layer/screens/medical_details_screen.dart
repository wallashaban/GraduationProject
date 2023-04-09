// ignore_for_file: must_be_immutable

import '../../../authentication_module/presentaion_layer/widgets/radio_widget.dart';
import '../../../core/utils/exports.dart';
import '../widgets/dropdown_list_widget.dart';

class MedicalDetailsScreen extends StatelessWidget {
  MedicalDetailsScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var medicineNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.h,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.darkColor,
              )),
          title: CustomText(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            size: 20.sp,
            text: AppStrings.medicalDetails,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: BlocBuilder<MedicalCubit, MedicalState>(
                  builder: (context, state) {
                    var cubit = BlocProvider.of<MedicalCubit>(context);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(right: 20.w),
                          child: CustomText(
                            text: AppStrings.bloodType,
                            color: AppColors.textColor,
                            size: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomDropdownList(
                          items: cubit.bloodTypes
                              .map(AppConstants.buildMenuItem)
                              .toList(),
                          onChanged: (bloodType) {
                            cubit.changeBloodTypeValue(bloodType);
                          },
                          value: cubit.bloodType,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right: 20.w),
                          child: CustomText(
                            text: AppStrings.allergy,
                            color: AppColors.textColor,
                            size: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomDropdownList(
                          items: cubit.bloodTypes
                              .map(AppConstants.buildMenuItem)
                              .toList(),
                          onChanged: (allergy) {
                            cubit.changeAllergyValue(allergy);
                          },
                          value: cubit.bloodType,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right: 20.w),
                          child: CustomText(
                            text: AppStrings.chronicDisease,
                            color: AppColors.textColor,
                            size: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomDropdownList(
                          items: cubit.bloodTypes
                              .map(AppConstants.buildMenuItem)
                              .toList(),
                          onChanged: (chronicDisease) {
                            cubit.changeChronicDiseaseValue(chronicDisease);
                          },
                          value: cubit.bloodType,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right: 20.w),
                          child: CustomText(
                            text: AppStrings.haveMedicine,
                            color: AppColors.textColor,
                            size: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                              Padding(
                                padding:  EdgeInsets.only(right: 20.w),
                                child: Row(
                                  children: [
                                    RadioWidget(groupValue: '',onChanged: (value){},text: AppStrings.yes,value: AppStrings.yes),
                                    SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                                    RadioWidget(groupValue: '',onChanged: (value){},text: AppStrings.no,value: AppStrings.no),
                                  ],
                                ),
                              ),
                        SizedBox(height: 5.h,),
                        CustomTextFormField(
                          controller: medicineNameController,
                          obscureText: false,
                          labelText: AppStrings.medicineName,
                          validator: (value) {},
                        ),
                        SizedBox(height: 10.h,),
                         Padding(
                           padding:  EdgeInsets.only(right: 20.w),
                           child: CustomText(
                            text: AppStrings.haveGeneticDisease,
                            color: AppColors.textColor,
                            size: 18.sp,
                            fontWeight: FontWeight.bold,
                                                 ),
                         ),
                        SizedBox(
                          height: 5.h,
                        ),
                         Padding(
                           padding:  EdgeInsets.only(right: 20.w),
                           child: Row(
                                  children: [
                                    RadioWidget(groupValue: '',onChanged: (value){},text: AppStrings.yes,value: AppStrings.yes),
                                    SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                                    RadioWidget(groupValue: '',onChanged: (value){},text: AppStrings.no,value: AppStrings.no),
                                  ],
                                ),
                         ),
                              SizedBox(height: 5.h,),
                        Padding(
                          padding:  EdgeInsets.only(right: 20.w),
                          child: CustomText(
                            text: AppStrings.geneticDisease,
                            color: AppColors.textColor,
                            size: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomDropdownList(
                          items: cubit.bloodTypes
                              .map(AppConstants.buildMenuItem)
                              .toList(),
                          onChanged: (chronicDisease) {
                            cubit.changeChronicDiseaseValue(chronicDisease);
                          },
                          value: cubit.bloodType,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Center(
                          child: CustomButton(text: AppStrings.saveData,
                          color: AppColors.textColor,onPressed: (){},size: 20.sp,fontWeight: FontWeight.bold,),
                        )
                      ],
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
