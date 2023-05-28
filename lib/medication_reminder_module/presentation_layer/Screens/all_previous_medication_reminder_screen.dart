import 'package:graduation_project/authentication_module/presentaion_layer/widgets/cutom_circular.dart';
import 'package:graduation_project/medication_reminder_module/presentation_layer/controllers/medication_reminder_cubit.dart';
import 'package:graduation_project/prescription_module/presentation_layer/widgets/no_data_widget.dart';

import '../../../core/utils/exports.dart';
import '../widgets/reminder_widget.dart';

class AllMedicationReminderScreen extends StatelessWidget {
  const AllMedicationReminderScreen({super.key});

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
            text: AppStrings.reminder,
          ),
        ),
        body: BlocConsumer<MedicationReminderCubit, ReminderState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = BlocProvider.of<MedicationReminderCubit>(context);
            if (state is GetAllRemindersSuccessState) {
              return SingleChildScrollView(
                child: cubit.allReminders.isEmpty
                    ? const NoDataWidget(
                      text: 'لا يوجد مواعيد مضافه',
                      image: AppImages.noteImage,
                      textButton: AppStrings.addReminder,
                      screen: AppRoutes.addMedicationReminderScreen,
                    )
                    : Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cubit.allReminders.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ReminderWidget(
                                reminder: cubit.allReminders[index],
                              );
                            },
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          CustomButton(
                            text: AppStrings.addNewReminder,
                            onPressed: () {
                              AppConstants.navigateTo(
                                context: context,
                                routeName:
                                    AppRoutes.addMedicationReminderScreen,
                              );
                            },
                          ),
                        ],
                      ),
              );
            }
            return const CustomCircularProgress();
          },
        ),
      ),
    );
  }
}
