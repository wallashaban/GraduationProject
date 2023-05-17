import 'package:dartz/dartz.dart';
import 'package:graduation_project/report_module/domain_layer/entity/vaccination_report.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
import '../base_repository/base_report_repository.dart';

class VaccinationReportUseCase
    implements BaseUseCase<Either<Failure, List<VaccinationReport>>, NoParameters> {
  final BaseReportRepository vaccinationReportUseCase;

  VaccinationReportUseCase(this.vaccinationReportUseCase);

  @override
  Future<Either<Failure, List<VaccinationReport>>> call(
      NoParameters parameters) async {
    return await vaccinationReportUseCase.vaccinationReport();
  }
}