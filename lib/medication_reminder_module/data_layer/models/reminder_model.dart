import '../../domain_layer/entities/reminder.dart';

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
      times: List<Times>.from(json['times'].map((e) => TimesModel.fromJson(e)))
          .toList(),
      days: json['days'],
    );
  }
}

class TimesModel extends Times {
  const TimesModel({
    required super.id,
    required super.time,
    required super.month,
  });
  factory TimesModel.fromJson(Map<String, dynamic> json) {
    return TimesModel(
      id: json['id'],
      time: json['time'],
      month: json['month'],
    );
  }
}
