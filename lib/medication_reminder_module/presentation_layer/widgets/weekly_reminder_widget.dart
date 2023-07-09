import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/medication_reminder_module/presentation_layer/controllers/medication_reminder_cubit.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'dose_time_widget.dart';

class WeeklyReminderWidget extends StatelessWidget {
  final TextEditingController timeController;
  List days;
  WeeklyReminderWidget(
      {super.key, required this.timeController, required this.days});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<MedicationReminderCubit>(context);
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        MultiSelectChipField(
          chipColor: AppColors.appBarColor,
          items: cubit.days
              .map((e) => MultiSelectItem<Days?>(e, e.day as String))
              .toList(),
          title: Text(
            " ايام الاسبوع",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          headerColor: AppColors.appBarColor,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1.8),
          ),
          selectedChipColor: AppColors.appBarColor,
          chipWidth: 40.w,
          showHeader: false,
          height: 30.h,
          textStyle: TextStyle(color: AppColors.white, fontSize: 12.sp),
          onTap: (values) {
            debugPrint('statement $values');
            days.clear();
            for (var element in values) {
              days.add(element!.id);
            }

            debugPrint('days $days');
          },
        ),
        SizedBox(
          height: 10.h,
        ),
        DoseTimeWidget(timeController: timeController),
      ],
    );
  }
}
