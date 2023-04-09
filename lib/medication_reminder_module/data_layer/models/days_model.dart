import '../../domain_layer/entities/days.dart';

class DaysModel extends Days {
  const DaysModel({
    required super.id,
    required super.day,
  });

  factory DaysModel.fromJson(Map<String, dynamic> json) {
    return DaysModel(
      id: json['id'],
      day: json['day'],
    );
  }
}
