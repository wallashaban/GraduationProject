import 'package:dartz/dartz.dart';
import 'package:graduation_project/report_module/domain_layer/base_repository/base_report_repository.dart';
import 'package:graduation_project/report_module/domain_layer/entity/medical_info.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';

class MedicalInfoUseCase
    implements BaseUseCase<Either<Failure, MedicalInfo>, NoParameters> {
  final BaseReportRepository baseReportRepository;

  MedicalInfoUseCase(this.baseReportRepository);

  @override
  Future<Either<Failure,MedicalInfo>> call(NoParameters parameters) async {
    return await baseReportRepository.medicalInfo();
  }
}