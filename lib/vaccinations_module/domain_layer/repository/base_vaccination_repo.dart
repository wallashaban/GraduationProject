import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../medical_details_module/domain_layer/entites/general.dart';
import '../entities/vaccination.dart';

abstract class BaseVaccinationRepository {
  Future<Either<Failure, List<Vaccination>>> getAllVaccination();
  Future<Either<Failure, Vaccination>> getSingleVaccination(int id);
  Future<Either<Failure, General>> attatchVaccination(int ids);
  Future<Either<Failure, General>> stopOrActiveVaccination(int status);
}
