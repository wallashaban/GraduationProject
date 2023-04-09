import 'package:graduation_project/medication_reminder_module/domain_layer/entities/days.dart';
import 'package:graduation_project/medication_reminder_module/domain_layer/entities/reminder.dart';

class ReminderModel extends Reminder {
  const ReminderModel({
    required super.id,
    required super.reminderName,
    required super.startDate,
    required super.endDate,
    required super.apponitment,
    required super.times,
    required super.days,
  });

  factory ReminderModel.fromJson(Map<String, dynamic> json) {
    return ReminderModel(
      id: json['id'],
      reminderName: json['medicine_name'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      apponitment: json['appointment'],
      times: List<Times>.from(json['times'].map((e)=>e)).toList(),
      days:List<Days>.from(json['days'].map((e)=>e)).toList(),
    );
  }
}
