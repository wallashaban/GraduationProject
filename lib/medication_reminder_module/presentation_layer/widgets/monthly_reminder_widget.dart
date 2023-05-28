import 'package:graduation_project/core/utils/exports.dart';

import 'dose_time_widget.dart';

class MonthlyReminderWidget extends StatelessWidget {
  final TextEditingController dateController;
  final TextEditingController timeController;
  const MonthlyReminderWidget(
      {super.key, required this.dateController, required this.timeController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
        CustomTextFormField(
          controller: dateController,
          onTap: () async {
            dateController.text = await AppConstants.showDate(context);
          },
          obscureText: false,
          labelText: AppStrings.dateMonth,
          validator: (value) {},
          suffix: Icons.date_range_outlined,
        ),
        SizedBox(
          height: 20.h,
        ),
        DoseTimeWidget(timeController: timeController),
      ],
    );
  }
}
