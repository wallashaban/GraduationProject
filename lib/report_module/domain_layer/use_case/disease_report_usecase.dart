import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
import '../base_repository/base_report_repository.dart';
import '../entity/disease_report.dart';

class DiseaseReportUseCase
    implements BaseUseCase<Either<Failure, List<DiseaseReport>>, NoParameters> {
  final BaseReportRepository baseReportRepository;

  DiseaseReportUseCase(this.baseReportRepository);

  @override
  Future<Either<Failure, List<DiseaseReport>>> call(
      NoParameters parameters) async {
    return await baseReportRepository.diseaseReport();
  }
}