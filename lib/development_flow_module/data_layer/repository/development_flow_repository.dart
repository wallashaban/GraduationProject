import 'package:dartz/dartz.dart';
import 'package:graduation_project/development_flow_module/data_layer/data_source/development_flow_remote_data_source.dart';
import 'package:graduation_project/development_flow_module/domain_layer/base_repository/development_flow_repository.dart';
import 'package:graduation_project/development_flow_module/domain_layer/entity/all_tips.dart';
import 'package:graduation_project/development_flow_module/domain_layer/entity/get_question.dart';
import 'package:graduation_project/development_flow_module/domain_layer/entity/subject_questions.dart';

import '../../../core/utils/exports.dart';

class DevelopmentFlowRepository extends BaseDevelopmentFlowRepository {
  final BaseDevelopmentFlowRemoteDataSource baseDevelopmentFlowRemoteDataSource;
  DevelopmentFlowRepository(
     this.baseDevelopmentFlowRemoteDataSource,
  );
  @override
  Future<Either<Failure, List<AllTips>>> allTips() async{
    try {
      final result = await baseDevelopmentFlowRemoteDataSource.allTips(
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
  Future<Either<Failure, General>> createTips(List parameters) async{try {
      final result = await baseDevelopmentFlowRemoteDataSource.createTips(
    parameters);
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
  Future<Either<Failure, List<QuestionsOfTip>>> questionsOfTips(int id) async{
try {
      final result = await baseDevelopmentFlowRemoteDataSource.questionsOfTip(id);
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
  Future<Either<Failure, List<SubjectWithQuestion>>> subjectsWithQuestions() async{
try {
      final result = await baseDevelopmentFlowRemoteDataSource.subjectsWithQuestions(
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
  Future<Either<Failure, General>> updateTips(UpdateTipsParameters parameters) async{
try {
      final result = await baseDevelopmentFlowRemoteDataSource.updateTips(
    parameters);
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
