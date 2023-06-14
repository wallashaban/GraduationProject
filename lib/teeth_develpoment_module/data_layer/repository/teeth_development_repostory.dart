import 'package:dartz/dartz.dart';
import 'package:graduation_project/teeth_develpoment_module/domain_layer/entities/medical_teeth.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
import '../../../medical_details_module/domain_layer/entites/general.dart';
import '../../domain_layer/entities/teeth.dart';
import '../../domain_layer/repository/base_teeth_repository.dart';
import '../data_source/teeth_development_remote_data_source.dart';

class TeethDevelopmentRepository implements BaseTeetDevelopmentRepository {
  final BaseTeethDevelopmentRemoteDataSource
      baseTeethDevelopmentRemoteDataSource;

  TeethDevelopmentRepository(this.baseTeethDevelopmentRemoteDataSource);


   @override
  Future<Either<Failure, General>> deleteTeethDevelpoment(int id)  async {
    
    try {
      final result = await baseTeethDevelopmentRemoteDataSource.deleteTeethDevelpoment(
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
  Future<Either<Failure, List<Teeth>>> getAllTeethDevelpoment()  async {
     try {
      final result = await baseTeethDevelopmentRemoteDataSource.getAllTeethDevelpoment(    );
   
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
  Future<Either<Failure, Teeth>> getSingleTeeth(int id)  async {
    
    try {
      final result = await baseTeethDevelopmentRemoteDataSource.getSingleTeeth(
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
  Future<Either<Failure, Teeth>> storeTeethDevelopment(TeethParameters parameters)  async {
    
    try {
      final result = await baseTeethDevelopmentRemoteDataSource.storeTeethDevelopment(
      parameters,
    );
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.message,
        ),
      );
    }
  }  @override
  Future<Either<Failure, Teeth>> updateTeethDevelopment(TeethParameters parameters)  async {
    
    try {
      final result = await baseTeethDevelopmentRemoteDataSource.updateTeethDevelopment(
      parameters,
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
  Future<Either<Failure, List<MedicalTeeth>>> getMedicalTeeth() async {
     try {
      final result = await baseTeethDevelopmentRemoteDataSource.getMedicalTeeth();
   
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
