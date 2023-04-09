import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
import '../../../medical_details_module/domain_layer/entites/general.dart';
import '../entities/prescribtion.dart';

abstract class BasePrescriptionRepository{
  //prescription

  Future<Either<Failure, General>> storePrescribtion(
      PresccriptionParameters parameters);
  Future<Either<Failure, List<Presccription>>> getAllPrescriptions();
  Future<Either<Failure, Presccription>> getSinglePrescription(int id);
  Future<Either<Failure, Presccription>> updatePrescription(
      PresccriptionParameters parameters);

  Future<Either<Failure, General>> deletePrescriPtion(int id);

}