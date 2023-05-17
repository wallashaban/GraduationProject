import '../../../core/utils/exports.dart';

class Vaccination extends Equatable {
  final int id;
  final String name;
  final String vaccineAge;
  final String prevention;
  final int status;
  final int important;
  final int numberOfSyrings;
  final String proposedVaccinationDate;
  final String vaccinationDate;
  final String? about;
  final String? sideEffects;
  const Vaccination({
    required this.id,
    required this.name,
    required this.important,
    required this.vaccineAge,
    required this.prevention,
    required this.numberOfSyrings,
    required this.status,
    required this.about,
    required this.sideEffects,
    required this.vaccinationDate,
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
