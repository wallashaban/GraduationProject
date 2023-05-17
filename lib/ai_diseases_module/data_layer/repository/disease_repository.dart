import 'package:dartz/dartz.dart';
import 'package:graduation_project/ai_diseases_module/data_layer/data_source/disease_remote_data_source.dart';
import 'package:graduation_project/medical_details_module/domain_layer/entites/general.dart';
import 'package:graduation_project/core/use_case/base_use_case.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/ai_diseases_module/domain_layer/entities/disease.dart';

import '../../../core/error/exception.dart';
import '../../../core/utils/exports.dart';
import '../../domain_layer/repository/disease_base_repository.dart';

class DiseaseRepository implements DiseaseBaseRepository {
  final BaseDiseaseRemoteDataSource baseDiseaseRemoteDataSource;

  DiseaseRepository(this.baseDiseaseRemoteDataSource);

  @override
  Future<Either<Failure, General>> deleteAiDisease(int id) async {
    try {
      final result = await baseDiseaseRemoteDataSource.deleteAiDisease(id);
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
  Future<Either<Failure, List<AiDisease>>> getAllAiDiseases() async {
    try {
      final result = await baseDiseaseRemoteDataSource.getAiDisease();
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
  Future<Either<Failure, General>> storeAiDisease(
      DiseaseParameters parameters) async {
    try {
      final result =
          await baseDiseaseRemoteDataSource.storeAiDisease(parameters);
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
  Future<String> predictDisease(PredictDiseaseParameters parameters) async {
    return await baseDiseaseRemoteDataSource.predictDisease(parameters);
  }
}
