import 'package:dartz/dartz.dart';
import '../../../core/utils/exports.dart';


class MedicalTestsRepository implements BaseMedicalTestsRepository {
  final BaseMedicalTestsRemoteDataSource baseMedicalTestsRemoteDataSource;

  MedicalTestsRepository(this.baseMedicalTestsRemoteDataSource);

  @override
  Future<Either<Failure, General>> deleteMedicalTest(int id)  async {
    
    try {
      final result = await baseMedicalTestsRemoteDataSource.deleteMedicalTest(
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
  Future<Either<Failure, List<MediaclTest>>> getAllMedicalTest() async {

    try {
          final result = await baseMedicalTestsRemoteDataSource.getAllMedicalTest(
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
  Future<Either<Failure, MediaclTest>> getSingleMedicalTest(int id)  async {
     try {
      final result = await baseMedicalTestsRemoteDataSource.getSingleMedicalTest( id,   );
   
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
  Future<Either<Failure, General>> storeMedicalTest(MediaclTestParameters parameters)  async {
    
    try {
      final result = await baseMedicalTestsRemoteDataSource.storeMedicalTest(
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
  Future<Either<Failure, General>> updateMedicalTest(MediaclTestParameters parameters)  async {
    
    try {
      final result = await baseMedicalTestsRemoteDataSource.updateMedicalTest(
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
