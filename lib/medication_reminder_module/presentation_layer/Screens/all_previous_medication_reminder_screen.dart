import 'package:graduation_project/medication_reminder_module/presentation_layer/controllers/medication_reminder_cubit.dart';

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
        body: BlocBuilder<MedicationReminderCubit, ReminderState>(
          builder: (context, state) {
            var cubit = BlocProvider.of<MedicationReminderCubit>(context);
            return SingleChildScrollView(
              child: Column(
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
                        routeName: AppRoutes.addMedicationReminderScreen,
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
