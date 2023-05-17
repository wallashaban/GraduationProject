import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/report_module/data_layer/data_source/report_remote_data_source.dart';
import 'package:graduation_project/report_module/domain_layer/base_repository/base_report_repository.dart';
import 'package:graduation_project/report_module/domain_layer/entity/disease_report.dart';
import 'package:graduation_project/report_module/domain_layer/entity/latest_development.dart';
import 'package:graduation_project/report_module/domain_layer/entity/latest_teeth.dart';
import 'package:graduation_project/report_module/domain_layer/entity/medical_info.dart';
import 'package:graduation_project/report_module/domain_layer/entity/vaccination_report.dart';

import '../../../core/error/exception.dart';

class ReportRepository extends BaseReportRepository {
  final BaseReportRemoteDataSource baseReportRemoteDataSource;
  ReportRepository(
     this.baseReportRemoteDataSource,
  );
  @override
  Future<Either<Failure, List<VaccinationReport>>> vaccinationReport(
    ) async {
    try {
      final result = await baseReportRemoteDataSource.vaccinationsReport();
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
  Future<Either<Failure, LatestDevelopment>> latestDevelopment() async {
    try {
      final result = await baseReportRemoteDataSource.latestDevelopments();
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
  Future<Either<Failure, List<DiseaseReport>>> diseaseReport() async {
    try {
      final result = await baseReportRemoteDataSource.diseasesReport();
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
  Future<Either<Failure, LatestTeeth>> latestTeeth()async {
    try {
      final result = await baseReportRemoteDataSource.latestTeeeth();
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
  Future<Either<Failure, MedicalInfo>> medicalInfo() async {
    try {
      final result = await baseReportRemoteDataSource.medicalsInfo();
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
