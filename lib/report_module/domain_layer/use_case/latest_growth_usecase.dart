import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
import '../../../growth_module/domain_layer/entities/growth.dart';
import '../base_repository/base_report_repository.dart';

class GetLatestGrowthOfChildUseCase
    implements BaseUseCase<Either<Failure, Growth>, NoParameters> {
  final BaseReportRepository baseLatestDevelopmentRepository;

  GetLatestGrowthOfChildUseCase(this.baseLatestDevelopmentRepository);

  @override
  Future<Either<Failure, Growth>> call(NoParameters parameters) async {
    return await baseLatestDevelopmentRepository.getLatestGrowthOfChild();
  }
}
