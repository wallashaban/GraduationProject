import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/growth_module/domain_layer/entities/growth.dart';

import '../repository/growth_base_repo.dart';

class CalculateGrowthUseCase
    implements BaseUseCase<Either<Failure, Growth>, GrowthParameters> {
  final GrowthBaseRepository growthBaseRepository;

  CalculateGrowthUseCase(this.growthBaseRepository);

  @override
  Future<Either<Failure, Growth>> call(GrowthParameters parameters) async {
    return await growthBaseRepository.calculateGrowth(parameters);
  }
}
