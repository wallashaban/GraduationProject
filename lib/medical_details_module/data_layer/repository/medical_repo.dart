
import 'package:dartz/dartz.dart';

import '../../../core/utils/exports.dart';


class MedicalRepository implements BaseMedicalDetailsRepository {
  final BaseMedicalRemoteDataSource baseMedicalRemoteDataSource;

  MedicalRepository(this.baseMedicalRemoteDataSource);

  

 
 
  @override
  Future<Either<Failure, List<Allergy>>> getAllAllergies()  async {
    
    try {
      final result = await baseMedicalRemoteDataSource.getAllAllergies();
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
  Future<Either<Failure, List<Disease>>> getAllChronicDieases()  async {
    try {
          final result = await baseMedicalRemoteDataSource.getAllChronicDieases(    );

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
  Future<Either<Failure, List<Disease>>> getAllGenticDiease() async {
    try {
          final result = await baseMedicalRemoteDataSource.getAllGenticDiease(    );

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
  Future<Either<Failure, List<Disease>>> getAllSkinDieases()  async {
    try {
    final result = await baseMedicalRemoteDataSource.getAllSkinDieases(    );

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
  Future<Either<Failure, General>> storeMedicalDetails(StoreMedicalDetailsParameters parameters)  async {
    
    try {
      final result = await baseMedicalRemoteDataSource.storeMedicalDetails(
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

 
 
 
 

 


}
