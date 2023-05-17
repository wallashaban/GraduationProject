import 'package:dartz/dartz.dart';
import 'package:graduation_project/report_module/domain_layer/entity/disease_report.dart';
import 'package:graduation_project/report_module/domain_layer/entity/latest_teeth.dart';
import 'package:graduation_project/report_module/domain_layer/entity/medical_info.dart';

import '../../../core/error/failure.dart';
import '../entity/latest_development.dart';
import '../entity/vaccination_report.dart';

abstract class BaseReportRepository {
  Future<Either<Failure,LatestDevelopment >> latestDevelopment();
  Future<Either<Failure, List<VaccinationReport>>> vaccinationReport();
  Future<Either<Failure,List<DiseaseReport> >> diseaseReport();
  Future<Either<Failure, MedicalInfo>> medicalInfo();
  Future<Either<Failure, LatestTeeth>> latestTeeth();


}