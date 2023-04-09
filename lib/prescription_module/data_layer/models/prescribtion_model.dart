
import '../../domain_layer/entities/prescribtion.dart';

class PrescribtionModel extends Presccription {
  const PrescribtionModel({
    required super.id,
    required super.note,
    required super.date,
    required super.file,
  });

  factory PrescribtionModel.fromJson(Map<String, dynamic> json) {
    return PrescribtionModel(
      id: json['id'],
      note: json['note'],
      date: json['date'],
      file: json['file'],
    );
  }
}
