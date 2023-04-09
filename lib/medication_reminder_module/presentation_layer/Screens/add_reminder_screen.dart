import 'package:graduation_project/core/utils/exports.dart';

import '../../../authentication_module/presentaion_layer/widgets/custom_text_form_field.dart';
import '../../../medical_details_module/presentation_layer/widgets/dropdown_list_widget.dart';
import '../controllers/medication_reminder_cubit.dart';

class AddReminderScreen extends StatelessWidget {
  AddReminderScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var medicineNAmeController = TextEditingController();
    var timeController = TextEditingController();
      var dateController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.darkColor,
              )),
          title: CustomText(
            text: AppStrings.medicationReminder,
            color: AppColors.textColor,
            size: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: BlocBuilder<MedicationReminderCubit, ReminderState>(
          builder: (context, state) {
            var cubit = BlocProvider.of<MedicationReminderCubit>(context);
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.h,
                horizontal: 15.w,
              ),
              child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        controller: medicineNAmeController,
                        obscureText: false,
                        labelText: AppStrings.medicineName,
                        validator: (value) {},
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: CustomText(
                          text: AppStrings.timeUsage,
                          color: AppColors.textColor,
                          size: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomDropdownList(
                        items: cubit.medicineTimes
                            .map(AppConstants.buildMenuItem)
                            .toList(),
                        onChanged: (time) {
                          cubit.changeReminderTimeValue(time);
                        },
                        value: cubit.medicineTime,
                      ),
                      SizedBox(height: 20.h,),
                      CustomTextFormField(
                        controller: timeController,
                        obscureText: false,
                        labelText: AppStrings.time,
                        validator: (value) {},
                      ),
                       Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: CustomText(
                          text: AppStrings.quantity,
                          color: AppColors.textColor,
                          size: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       SizedBox(
                        height: 5.h,
                      ),
                      CustomDropdownList(
                        items: cubit.quantities
                            .map(AppConstants.buildMenuItem)
                            .toList(),
                        onChanged: (quantity) {
                          cubit.changeReminderQuantityValue(quantity);
                        },
                        value: cubit.quantity,
                      ),
                      SizedBox(height: 20.h,),
                          Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.appBarColor,
                        child: Icon(
                          Icons.add,
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      CustomText(
                        text: AppStrings.addNewDose,
                        color: AppColors.textColor,
                        size: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),

                    ],
                  ),
                  SizedBox(height: 20.h,),
                  CustomTextFormField(
                        controller: dateController,
                        obscureText: false,
                        labelText: AppStrings.stopMedicineTime,
                        validator: (value) {},
                      ),
                      SizedBox(height: 20.h,),
                       Center(
                          child: CustomButton(text: AppStrings.saveData,
                          color: AppColors.textColor,onPressed: (){},size: 20.sp,fontWeight: FontWeight.bold,),
                        ),
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}
