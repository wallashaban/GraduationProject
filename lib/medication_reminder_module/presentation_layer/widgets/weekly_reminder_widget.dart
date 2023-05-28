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
          // selectedTextStyle: TextStyle(color: AppColors.black, fontSize: 12.sp),
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
        /* MultiSelectDialogField(
          items: cubit.allDays.map((e) => MultiSelectItem(e, e)).toList(),
          // title: Text("Animals"),
          selectedColor: Colors.blue,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(40)),
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
          ),
          buttonIcon: Icon(
            Icons.pets,
            color: Colors.blue,
          ),
          buttonText: Text(
            "Favorite Animals",
            style: TextStyle(
              color: Colors.blue[800],
              fontSize: 16,
            ),
          ),
          onConfirm: (results) {
            //_selectedAnimals = results;
          },
        ),
        */
        /*   MultiSelectChipDisplay(
          //dialogHeight: 30.h,
          height: 30.h,
          chipWidth: 40.w,
          scroll: true,
          textStyle: TextStyle(fontSize: 12.sp, color: AppColors.white),
          chipColor: AppColors.black,
          colorator: (p0) {
            
            return AppColors.redColor;
          },
          decoration: BoxDecoration(
            color: AppColors.white,
          ),

          items: cubit.allDays.map((e) => MultiSelectItem(e, e)).toList(),
          onTap: (values) async {
            debugPrint('statement $values');

            for (var element in cubit.days) {
              if (values == element.day) {
                days.add(element.id);
                debugPrint('statementtt');
              }
            }

            debugPrint('days $days');
          },
        ),
       */
        SizedBox(
          height: 20.h,
        ),
        DoseTimeWidget(timeController: timeController),
      ],
    );
  }
}
