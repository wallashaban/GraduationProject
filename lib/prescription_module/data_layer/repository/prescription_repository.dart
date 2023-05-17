import 'package:dartz/dartz.dart';
import '../data_source/prescription_remote_data_source.dart';
import '../../domain_layer/repository/base_prescription_repository.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
import '../../../medical_details_module/domain_layer/entites/general.dart';
import '../../domain_layer/entities/prescribtion.dart';

class PrescriptionRepository implements BasePrescriptionRepository {
  final BasePrescriptionRemotDataSource basePrescriptionRemotDataSource;

  PrescriptionRepository(this.basePrescriptionRemotDataSource);

   @override
  Future<Either<Failure, General>> deletePrescriPtion(int id)  async {
    
    try {
      final result = await basePrescriptionRemotDataSource.deletePrescriPtion(
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
  Future<Either<Failure, List<Presccription>>> getAllPrescriptions() async {
    try {
          final result = await basePrescriptionRemotDataSource.getAllPrescriptions(    );

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
  Future<Either<Failure, Presccription>> getSinglePrescription(int id)  async {
     try {
      final result = await basePrescriptionRemotDataSource.getSinglePrescription(
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
  Future<Either<Failure, General>> storePrescribtion(PresccriptionParameters parameters)  async {
    
    try {
      final result = await basePrescriptionRemotDataSource.storePrescribtion(
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
  Future<Either<Failure, Presccription>> updatePrescription(PresccriptionParameters parameters)  async {
    
    try {
      final result = await basePrescriptionRemotDataSource.updatePrescription(
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
