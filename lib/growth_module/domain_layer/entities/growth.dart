import 'package:graduation_project/core/utils/exports.dart';

class Growth extends Equatable {
  final int id;
  final dynamic height;
  final dynamic weight;
  final String heightStatus;
  final String weightStatus;
  final String measureDate;
  const Growth({
    required this.id,
    required this.height,
    required this.weight,
    required this.heightStatus,
    required this.weightStatus,
    required this.measureDate,
  });

  @override
  List<Object?> get props => [
        id,
        height,
        weight,
        heightStatus,
        weightStatus,
        measureDate,
      ];
}
