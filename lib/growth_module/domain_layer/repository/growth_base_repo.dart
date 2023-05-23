import 'package:dartz/dartz.dart';

import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/growth_module/domain_layer/entities/growth.dart';

abstract class GrowthBaseRepository {
  Future<Either<Failure, Growth>> calculateGrowth(GrowthParameters parameters);
  Future<Either<Failure, List<Growth>>> getAllGrowthofChild();

}


