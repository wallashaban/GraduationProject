
import '../../domain_layer/entites/general.dart';

class GeneralModel extends General {
 const GeneralModel({
    required super.data,
    required super.message,
    required super.status,
  });

  factory GeneralModel.fromJson(Map<String, dynamic> json) {
    return GeneralModel(
      data: json['data'],
      message: json['message'],
      status: json['status'],
    );
  }
}
