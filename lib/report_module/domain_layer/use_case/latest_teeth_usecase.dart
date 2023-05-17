import 'package:dartz/dartz.dart';
import 'package:graduation_project/report_module/domain_layer/base_repository/base_report_repository.dart';
import 'package:graduation_project/report_module/domain_layer/entity/latest_teeth.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';

class LatestTeethUseCase
    implements BaseUseCase<Either<Failure, LatestTeeth>, NoParameters> {
  final BaseReportRepository baseReportRepository;

  LatestTeethUseCase(this.baseReportRepository);

  @override
  Future<Either<Failure,LatestTeeth>> call(
      NoParameters parameters) async {
    return await baseReportRepository.latestTeeth();
  }
}