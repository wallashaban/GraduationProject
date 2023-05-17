// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:graduation_project/medication_reminder_module/presentation_layer/controllers/medication_reminder_cubit.dart';

import '../../../core/utils/exports.dart';

class DoseTimeWidget extends StatelessWidget {
  final timeController;
  const DoseTimeWidget({super.key, required this.timeController});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<MedicationReminderCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextFormField(
            onTap: () {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ).then((value) =>
                  timeController.text = '${value!.hour}:${value.minute}');
            },
            width: MediaQuery.of(context).size.width * 0.8,
            controller: timeController,
            obscureText: false,
            labelText: AppStrings.time,
            validator: (value) {},
          ),
          if (cubit.index != 0)
            IconButton(
                onPressed: () {
                  cubit.deleteDose();
                },
                icon: Icon(
                  Icons.delete,
                  color: AppColors.darkColor,
                )),
        ],
      ),
    );
  }
}

class Singlton {
  static Singlton? _instance;
  static get instance {
    _instance??= Singlton._internal();
    return _instance!;
  }
  static Singlton getInstance() {
    _instance??= Singlton._internal();
    return _instance!;
  }

  Singlton._internal();
}
