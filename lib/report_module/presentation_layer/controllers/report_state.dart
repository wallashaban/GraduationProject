import 'package:graduation_project/core/utils/exports.dart';

class ReportState extends Equatable{
  @override
  List<Object?> get props => [];
}
class ReportInitialState extends ReportState{}
class MedicalInfoLoadingState extends ReportState{}
class MedicalInfoSuccessState extends ReportState{}
class MedicalInfoErrorState extends ReportState{
  final String error;
  MedicalInfoErrorState({
    required this.error,
  });
}

class LatestTeethLoadingState extends ReportState{}
class LatestTeethSuccessState extends ReportState{}
class LatestTeethErrorState extends ReportState{
  final String error;
  LatestTeethErrorState({
    required this.error,
  });
}

class LatestDevelopmentLoadingState extends ReportState{}
class LatestDevelopmentSuccessState extends ReportState{}
class LatestDevelopmentErrorState extends ReportState{
  final String error;
  LatestDevelopmentErrorState({
    required this.error,
  });
}

class DiseaseReportLoadingState extends ReportState{}
class DiseaseReportSuccessState extends ReportState{}
class DiseaseReportErrorState extends ReportState{
  final String error;
  DiseaseReportErrorState({
    required this.error,
  });
}

class VaccinationReportLoadingState extends ReportState{}
class VaccinationReportSuccessState extends ReportState{}
class VaccinationReportErrorState extends ReportState{
  final String error;
  VaccinationReportErrorState({
    required this.error,
  });
}