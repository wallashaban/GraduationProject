import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/growth_module/domain_layer/entities/growth.dart';

import '../repository/growth_base_repo.dart';

class GetAllGrowthOfChildUseCase
    implements BaseUseCase<Either<Failure, List<Growth>>, NoParameters> {
  final GrowthBaseRepository growthBaseRepository;

  GetAllGrowthOfChildUseCase(this.growthBaseRepository);

  @override
  Future<Either<Failure, List<Growth>>> call(NoParameters parameters) async {
    return await growthBaseRepository.getAllGrowthofChild();
  }
}
