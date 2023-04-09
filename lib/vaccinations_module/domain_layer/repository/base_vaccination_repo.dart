import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/medical_details_module/domain_layer/entites/general.dart';
import 'package:graduation_project/vaccinations_module/domain_layer/entities/vaccination.dart';

abstract class BaseVaccinationRepository {
  Future<Either<Failure, List<Vaccination>>> getAllVaccination();
  Future<Either<Failure, Vaccination>> getSingleVaccination(int id);
  Future<Either<Failure, General>> attatchVaccination(List ids);
  Future<Either<Failure, General>> stopOrActiveVaccination(int status);
}
