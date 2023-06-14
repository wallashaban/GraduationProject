
import 'package:dartz/dartz.dart';

import '../../../core/utils/exports.dart';
import '../../domain_layer/entites/medical_details.dart';


class MedicalRepository implements BaseMedicalDetailsRepository {
  final BaseMedicalRemoteDataSource baseMedicalRemoteDataSource;

  MedicalRepository(this.baseMedicalRemoteDataSource); 
   @override
  Future<Either<Failure, MedicalDetails>> storeMedicalDetails(StoreMedicalDetailsParameters parameters)  async {
    
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
  
  @override
  Future<Either<Failure, MedicalDetails>> updateMedicalDetails(StoreMedicalDetailsParameters parameters)async {
    try {
      final result = await baseMedicalRemoteDataSource.updateMedicalDetails(
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
  Future<Either<Failure, MedicalDetails>> showMedicalDetails()  async {
    try {
      final result = await baseMedicalRemoteDataSource.showMedicalDetails(    );
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
