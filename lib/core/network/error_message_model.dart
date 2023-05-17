import '../utils/exports.dart';

class ErrorMessageModel extends Equatable {
 // final String? data;
  final String message;
  final bool? status;
  const ErrorMessageModel({
  //  required this.data,
    required this.message,
    required this.status,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
     // data: json['data'],
      message: json['message'],
      status: json['status'],
    );
  }

  @override
  List<Object?> get props => [
    //    data,
        message,
        status,
      ];
}
