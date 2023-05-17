// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:graduation_project/core/utils/exports.dart';

class VaccinationReport extends Equatable {
  final int status;
  final String name;
  final String prevention;
  const VaccinationReport({
    required this.prevention,
    required this.name,
    required this.status,
  });

  @override
  List<Object?> get props => [
        prevention,
        name,
        status,
      ];
}
