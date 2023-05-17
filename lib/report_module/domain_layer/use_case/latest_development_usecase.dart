import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
import '../base_repository/base_report_repository.dart';
import '../entity/latest_development.dart';

class LatestDevelopmentUseCase
    implements BaseUseCase<Either<Failure, LatestDevelopment>, NoParameters> {
  final BaseReportRepository baseLatestDevelopmentRepository;

  LatestDevelopmentUseCase(this.baseLatestDevelopmentRepository);

  @override
  Future<Either<Failure, LatestDevelopment>> call(NoParameters parameters) async {
    return await baseLatestDevelopmentRepository.latestDevelopment();
  }
}
