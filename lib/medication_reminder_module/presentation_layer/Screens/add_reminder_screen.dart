// ignore_for_file: must_be_immutable, avoid_function_literals_in_foreach_calls, use_build_context_synchronously

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:graduation_project/core/utils/exports.dart';

import '../../../logger.dart';
import '../../../medical_details_module/presentation_layer/widgets/dropdown_list_widget.dart';
import '../controllers/medication_reminder_cubit.dart';
import '../widgets/add_new_dose_widget.dart';
import '../widgets/dose_time_widget.dart';
import '../widgets/monthly_reminder_widget.dart';
import '../widgets/weekly_reminder_widget.dart';

class AddReminderScreen extends StatelessWidget {
  AddReminderScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var medicineNAmeController = TextEditingController();

  var timeController = TextEditingController();
  /*var timeController2 = TextEditingController();
  var timeController3 = TextEditingController(); */
  var endDateController = TextEditingController();
  var dateController = TextEditingController();

  List<int> days = [];
  @override
  Widget build(BuildContext context) {
    logger.e('error add reminder');
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
              )),
          title: const CustomText(
            text: AppStrings.medicationReminder,
          ),
        ),
        body: BlocConsumer<MedicationReminderCubit, ReminderState>(
          listener: (context, state) {
            if (state is StoreReminderErrorState) {
              AppConstants.showSnackbar(
                context: context,
                content: state.error,
              );
            }
            if (state is StoreReminderSuccessState) {
              AppConstants.showSnackbar(
                context: context,
                content: AppStrings.saveSuccess,
              );
            }
          },
          builder: (context, state) {
            var cubit = BlocProvider.of<MedicationReminderCubit>(context);
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: 30.h,
                horizontal: 15.w,
              ),
              child: ListView(
                children: [
                  Form(
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
                              logger.e('error timer reminder');

                              cubit.changeReminderTimeValue(time);
                            },
                            value: cubit.medicineTime,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          if (cubit.medicineTime == null)
                            DoseTimeWidget(
                              timeController: timeController,
                            ),
                          if (cubit.medicineTime == 'شهريا')
                            MonthlyReminderWidget(
                              dateController: dateController,
                              timeController: timeController,
                            ),
                          if (cubit.medicineTime == 'اسبوعيا')
                            WeeklyReminderWidget(
                              timeController: timeController,
                              days: days,
                            ),
                          SizedBox(
                            height: 15.h,
                          ),
                          if (cubit.medicineTime == 'يوميا')
                            AddNewDoseWidget(
                              timerController: cubit.timerController,
                            ),
                          SizedBox(
                            height: 15.h,
                          ),
                          InkWell(
                            onTap: () async {
                              endDateController.text =
                                  await AppConstants.showDate(context);
                            },
                            child: CustomTextFormField(
                              controller: endDateController,
                              enabled: false,
                              obscureText: false,
                              labelText: AppStrings.stopMedicineTime,
                              validator: (value) {},
                              suffix: Icons.date_range_outlined,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          if (state is StoreReminderLoadingState)
                            CustomButton(
                              isLoading: true,
                            ),
                          if (state is! StoreReminderLoadingState)
                            CustomButton(
                              text: AppStrings.saveData,
                              onPressed: () async {
                                if (await AppConstants.checkConnectivity() ==
                                    ConnectivityResult.none) {
                                  AppConstants.showSnackbar(
                                    context: context,
                                    content: AppStrings.noInternet,
                                  );
                                } else {
                                  await AppConstants.addTime(
                                    context: context,
                                    dateController: dateController,
                                    timeController: timeController,
                                    days: days,
                                    timerController: cubit.timerController,
                                  ).then((value) {
                                    if (cubit.medicineTime == 'اسبوعيا' &&
                                        days.isEmpty) {
                                      AppConstants.showSnackbar(
                                        context: context,
                                        content: 'من فضلك قم باضافه الايام',
                                      );
                                    } else {
                                      cubit.storeMedicationReminder(
                                        ReminderParameters(
                                          medicineName:
                                              medicineNAmeController.text,
                                          appointment: cubit.medicineTime,
                                          endDate: endDateController.text,
                                          times: value,
                                        ),
                                      );
                                    }
                                  });
                                }
                              },
                            ),
                        ],
                      )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
