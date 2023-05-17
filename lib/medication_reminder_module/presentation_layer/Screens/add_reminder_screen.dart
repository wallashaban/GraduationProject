// ignore_for_file: must_be_immutable, avoid_function_literals_in_foreach_calls

import 'package:graduation_project/core/utils/exports.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

import '../../../medical_details_module/presentation_layer/widgets/dropdown_list_widget.dart';
import '../controllers/medication_reminder_cubit.dart';
import '../widgets/dose_time_widget.dart';

class AddReminderScreen extends StatelessWidget {
  AddReminderScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var medicineNAmeController = TextEditingController();

  var timeController1 = TextEditingController();
  var timeController2 = TextEditingController();
  var timeController3 = TextEditingController();
  var endDateController = TextEditingController();
    var dateController = TextEditingController();

  List timerController = [
    //TextEditingController(),
  ];
  List? days;
  List medicineTime = [];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
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
              child: Center(
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
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomDropdownList(
                          hint: AppStrings.timeUsage,
                          items: cubit.medicineTimes
                              .map(AppConstants.buildMenuItem)
                              .toList(),
                          onChanged: (time) {
                            cubit.changeReminderTimeValue(time);
                          },
                          value: cubit.medicineTime,
                        ),
                        if (cubit.medicineTime == 'اسبوعيا')
                          MultiSelectDialogField(
                            /*  onSelectionChanged: (p0) {
                              debugPrint('po ${p0}');
                            }, */
                            items: cubit.allDays
                                .map((e) => MultiSelectItem(e, e))
                                .toList(),
                            listType: MultiSelectListType.CHIP,
                            onConfirm: (values) {
                              days = [];
                              values.forEach((element) {
                                days!.add(cubit.allDays.indexOf(element) + 1);
                              });
                              //days.add(values);
                              debugPrint('days $days');
                            },
                          ),
                          SizedBox(
                          height: 20.h,
                        ),
                          if (cubit.medicineTime == 'اسبوعيا'|| cubit.medicineTime == 'شهريا')
                          DoseTimeWidget(timeController: timeController1),
                           SizedBox(
                          height: 20.h,
                        ),
                                                if (cubit.medicineTime == 'شهريا')
  CustomTextFormField(
                          controller: dateController,
                          onTap: () async {
                            endDateController.text =
                                await AppConstants.showDate(context);
                          },
                          obscureText: false,
                          labelText: AppStrings.dateMonth,
                          validator: (value) {},
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Expanded(
                          // height: 100.h,
                          child: ListView.builder(
                            itemBuilder: (context, index) => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DoseTimeWidget(
                                  timeController: timerController[
                                      index] /* index==1?timeController1:  timerController[index] */,
                                ),
                              ],
                            ),
                            itemCount: cubit.index,
                          ),
                        ),
                        if (cubit.medicineTime == 'يوميا')  
                          InkWell(
                            onTap: () {
                              final controller = TextEditingController();
                              timerController.add(controller);
                              cubit.addNewDose();
                            },
                            child: Row(
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
                          ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          controller: endDateController,
                          onTap: () async {
                            endDateController.text =
                                await AppConstants.showDate(context);
                          },
                          obscureText: false,
                          labelText: AppStrings.stopMedicineTime,
                          validator: (value) {},
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: CustomButton(
                            text: AppStrings.saveData,
                            color: AppColors.textColor,
                            onPressed: () async {
                              await addTime(context).then((value) {
                                debugPrint('times $medicineTime');
                                cubit.storeMedicationReminder(
                                  ReminderParameters(
                                    medicineName: medicineNAmeController.text,
                                    appointment: cubit.medicineTime,
                                    endDate: endDateController.text,
                                    times: medicineTime,
                                  ),
                                );
                              });
                              debugPrint(
                                  'timer ${timeController1.text} ${timeController2.text}');
                            },
                            size: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
              ),
            );
          },
        ),
      ),
    );
  }

  Future addTime(context) async {
   // debugPrint('controller ${timerController[0].text}');
    for (int i = 0;
        i < BlocProvider.of<MedicationReminderCubit>(context).index;
        i++) {
      var times = [
        MedicineTimes(
                time: timerController[i].text,
                days: days,
                month: dateController.text)
            .toMap()
      ];
      medicineTime += times;
    }
  }
}
