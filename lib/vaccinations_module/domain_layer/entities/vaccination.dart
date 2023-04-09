import 'package:graduation_project/core/utils/exports.dart';

class Vaccination extends Equatable {
 final int id;
 final String name;
 final String vaccineAge;
 final String prevention;
 final int status;
 final String proposedVaccinationDate;
  const Vaccination({
    required this.id,
    required this.name,
    required this.vaccineAge,
    required this.prevention,
    required this.status,
    required this.proposedVaccinationDate,
  });
  
  @override
  List<Object?> get props => [
    id,
    name,
    vaccineAge,
    prevention,
    status,
    proposedVaccinationDate,
  ];
}
