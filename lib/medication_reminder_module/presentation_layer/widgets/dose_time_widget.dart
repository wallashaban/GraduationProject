// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:graduation_project/medication_reminder_module/presentation_layer/controllers/medication_reminder_cubit.dart';

import '../../../core/utils/exports.dart';

class DoseTimeWidget extends StatelessWidget {
  final timeController;
  final bool isDaily;
  const DoseTimeWidget({super.key, required this.timeController,
  this.isDaily=false});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<MedicationReminderCubit>(context);
    return CustomTextFormField(
      onTap: () {
        showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        ).then(
            (value) => timeController.text = '${value!.hour}:${value.minute}');
      },
      controller: timeController,
      obscureText: false,
      labelText: AppStrings.time,
      validator: (value) {},
      suffix:isDaily? Icons.alarm_off: Icons.alarm,
      sufixPressed: () {
        if (isDaily) {
          cubit.deleteDose();
        }
      },
    );
  }
}

class Singlton {
  static Singlton? _instance;
  static get instance {
    _instance ??= Singlton._internal();
    return _instance!;
  }

  static Singlton getInstance() {
    _instance ??= Singlton._internal();
    return _instance!;
  }

  Singlton._internal();
}
