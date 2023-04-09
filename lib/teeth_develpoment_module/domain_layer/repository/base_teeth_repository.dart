import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
import '../../../medical_details_module/domain_layer/entites/general.dart';
import '../entities/teeth.dart';

abstract class BaseTeetDevelopmentRepository{
  // teeth development
  Future<Either<Failure, General>> storeTeethDevelopment(
      TeethParameters parameters);
  Future<Either<Failure, General>> updateTeethDevelopment(TeethParameters parameters);
  Future<Either<Failure, General>> deleteTeethDevelpoment(int id);
  Future<Either<Failure, Teeth>> getSingleTeeth(int id);
  Future<Either<Failure, List<Teeth>>> getAllTeethDevelpoment();

}