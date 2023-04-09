import 'package:equatable/equatable.dart';

class VaccinationReport extends Equatable {
 final String name;
 final String preventions;
 final int status;
 const VaccinationReport({
    required this.name,
    required this.preventions,
    required this.status,
  });
  
  @override
  List<Object?> get props => [
    name,
    preventions,
    status,
  ];
}
