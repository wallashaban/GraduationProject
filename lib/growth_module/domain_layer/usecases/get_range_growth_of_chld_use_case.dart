import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/growth_module/domain_layer/entities/range_growth.dart';

import '../repository/growth_base_repo.dart';

class GetRangeGrowthOfChildUseCase
    implements BaseUseCase<Either<Failure, RangeGrowth>, NoParameters> {
  final GrowthBaseRepository growthBaseRepository;

  GetRangeGrowthOfChildUseCase(this.growthBaseRepository);

  @override
  Future<Either<Failure, RangeGrowth>> call( NoParameters parameters) async {
    return await growthBaseRepository.getRangeGrowthofChild();
  }
}
