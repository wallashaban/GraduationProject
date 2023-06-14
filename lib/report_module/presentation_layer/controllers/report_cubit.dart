// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/use_case/base_use_case.dart';
import 'package:graduation_project/report_module/domain_layer/entity/disease_report.dart';
import 'package:graduation_project/report_module/domain_layer/entity/latest_development.dart';
import 'package:graduation_project/report_module/domain_layer/entity/latest_teeth.dart';
import 'package:graduation_project/report_module/domain_layer/entity/medical_info.dart';
import 'package:graduation_project/report_module/domain_layer/entity/vaccination_report.dart';
import 'package:graduation_project/report_module/domain_layer/use_case/disease_report_usecase.dart';
import 'package:graduation_project/report_module/domain_layer/use_case/latest_development_usecase.dart';
import 'package:graduation_project/report_module/domain_layer/use_case/latest_teeth_usecase.dart';
import 'package:graduation_project/report_module/domain_layer/use_case/medical_info_usecase.dart';
import 'package:graduation_project/report_module/domain_layer/use_case/vaccination_report_usecase.dart';
import 'package:graduation_project/report_module/presentation_layer/controllers/report_state.dart';
import '../../../core/error/failure.dart';
import '../../../growth_module/domain_layer/entities/growth.dart';
import '../../domain_layer/use_case/latest_growth_usecase.dart';

class ReportCubit extends Cubit<ReportState> {
  final DiseaseReportUseCase diseaseReportUseCase;
  final LatestDevelopmentUseCase latestDevelopmentUseCase;
  final LatestTeethUseCase latestTeethUseCase;
  final MedicalInfoUseCase medicalInfoUseCase;
  final VaccinationReportUseCase vaccinationReportUseCase;
  final GetLatestGrowthOfChildUseCase getLatestGrowthOfChildUseCase;

  Failure serverFailure = const ServerFailure(
    message: 'message',
  );
  ReportCubit(
    this.diseaseReportUseCase,
    this.latestDevelopmentUseCase,
    this.latestTeethUseCase,
    this.medicalInfoUseCase,
    this.vaccinationReportUseCase,
    this.getLatestGrowthOfChildUseCase,
  ) : super(ReportInitialState());

  List<VaccinationReport>? allVaccinationReport;
  List<DiseaseReport>? allDiseaseReport;
  LatestDevelopment? latestDevelopment;
  LatestTeeth? latestTeeth;
  MedicalInfo? medicalInfo;
  Growth? growth;

  Future getLatestGrowthOfChild() async {
    emit(GetLatestGrowthLoadingSatate());
    final result = await getLatestGrowthOfChildUseCase(const NoParameters());
    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error stop ${l.message.toString()}');
        emit(
          GetLatestGrowthErrorSatate(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        growth = r;
        emit(GetLatestGrowthSuccessSatate());
      },
    );
  }


  Future vaccinationReports() async {
    emit(VaccinationReportLoadingState());
    final result = await vaccinationReportUseCase(const NoParameters());
    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error stop ${l.message.toString()}');
        emit(
          VaccinationReportErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        allVaccinationReport = r;
        emit(VaccinationReportSuccessState());
      },
    );
  }

  Future diseaseReports() async {
    emit(DiseaseReportLoadingState());
    final result = await diseaseReportUseCase(const NoParameters());
    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error stop ${l.message.toString()}');
        emit(
          DiseaseReportErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        allDiseaseReport = r;
        emit(DiseaseReportSuccessState());
      },
    );
  }

  Future latesttTeeth() async {
    emit(LatestTeethLoadingState());
    final result = await latestTeethUseCase(const NoParameters());
    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error stop ${l.message.toString()}');
        emit(
          LatestTeethErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        latestTeeth = r;
        emit(LatestTeethLoadingState());
      },
    );
  }

  Future latesttDevelopment() async {
    emit(LatestDevelopmentLoadingState());
    final result = await latestDevelopmentUseCase(const NoParameters());
    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error stop ${l.message.toString()}');
        emit(
          LatestDevelopmentErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        latestDevelopment = r;
        emit(LatestDevelopmentSuccessState());
      },
    );
  }

  Future medicalsInfo() async {
    emit(MedicalInfoLoadingState());
    final result = await medicalInfoUseCase(const NoParameters());
    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error stop ${l.message.toString()}');
        emit(
          MedicalInfoErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        medicalInfo = r;
        emit(MedicalInfoSuccessState());
      },
    );
  }
}
