import 'package:graduation_project/core/utils/exports.dart';


class Reminder extends Equatable {
 final int id;
 final String reminderName;
 final String startDate;
 final String endDate;
 final String apponitment;
 final List<Times> times;
 final List<Days> days;
 const Reminder({
    required this.id,
    required this.reminderName,
    required this.startDate,
    required this.endDate,
    required this.apponitment,
    required this.times,
    required this.days,
  });
  
  @override
  List<Object?> get props => [
    id,
    reminderName,
    startDate,
    endDate,
    apponitment,
    times,
    days,
  ];
}

class Times extends Equatable {
  final int id;
  final String quantity;
  final String time;
  final String month;
  const Times({
    required this.id,
    required this.quantity,
    required this.time,
    required this.month,
  });

  @override
  List<Object?> get props => [
        id,
        quantity,
        time,
        month,
      ];
}
