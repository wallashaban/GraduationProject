import 'package:graduation_project/core/use_case/base_use_case.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/growth_module/data_layer/data_source/growth_remote_data_source.dart';
import 'package:graduation_project/growth_module/domain_layer/entities/growth.dart';
import 'package:graduation_project/growth_module/domain_layer/entities/range_growth.dart';
import 'package:graduation_project/growth_module/domain_layer/repository/growth_base_repo.dart';

import '../../../core/error/exception.dart';

class GrowthRepository implements GrowthBaseRepository {
  final BaseGrowthRemoteDataSource baseGrowthRemoteDataSource;

  GrowthRepository(this.baseGrowthRemoteDataSource);

  @override
  Future<Either<Failure, Growth>> calculateGrowth(GrowthParameters parameters) async {
    try {
      final result =
          await baseGrowthRemoteDataSource.calculateGrowth(parameters);
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
  Future<Either<Failure, List<Growth>>> getAllGrowthofChild() async {
    try {
      final result =
          await baseGrowthRemoteDataSource.getAllGrowthofChild();
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
  Future<Either<Failure, Growth>> editGrowth(GrowthParameters parameters) async {
    try {
      final result =
          await baseGrowthRemoteDataSource.editGrowth(parameters);
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
  Future<Either<Failure, RangeGrowth>> getRangeGrowthofChild() async {
    try {
      final result =
          await baseGrowthRemoteDataSource.getRangeGrowthOfChild();
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
