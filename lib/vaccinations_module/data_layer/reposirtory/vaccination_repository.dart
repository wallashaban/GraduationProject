import '../../../medical_details_module/domain_layer/entites/general.dart';
import '../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../data_source/vaccination_remote_data_source.dart';
import '../../domain_layer/entities/vaccination.dart';
import '../../domain_layer/repository/base_vaccination_repo.dart';

import '../../../core/error/exception.dart';

class VaccinationRepository implements BaseVaccinationRepository {
  final BaseVaccinationRemoteDataSource baseVaccinationRemoteDataSource;

  VaccinationRepository(this.baseVaccinationRemoteDataSource);

  @override
  Future<Either<Failure, General>> attatchVaccination(List ids)async {
    try {
      final result = await baseVaccinationRemoteDataSource.attatchVaccination(
      ids,
    );
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.message,
        ),
      );
    } 
  }

  @override
  Future<Either<Failure, List<Vaccination>>> getAllVaccination() async {
    try {
      final result = await baseVaccinationRemoteDataSource.getAllVaccination(    );
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.message,
        ),
      );
    } 
  }

  @override
  Future<Either<Failure, Vaccination>> getSingleVaccination(int id) async {
    try {
      final result = await baseVaccinationRemoteDataSource.getSingleVaccination(
      id,
    );
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.message,
        ),
      );
    } 
  }

  @override
  Future<Either<Failure, General>> stopOrActiveVaccination(int status) async {
    try {
      final result = await baseVaccinationRemoteDataSource.stopOrActiveVaccination(
      status,
    );
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.message,
        ),
      );
    } 
  }
}
