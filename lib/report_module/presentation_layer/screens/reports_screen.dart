// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/authentication_module/presentaion_layer/widgets/cutom_circular.dart';
import 'package:graduation_project/core/utils/app_images.dart';
import 'package:graduation_project/core/utils/app_strings.dart';
import 'package:graduation_project/report_module/presentation_layer/controllers/report_cubit.dart';
import 'package:graduation_project/report_module/presentation_layer/controllers/report_state.dart';
import 'package:graduation_project/report_module/presentation_layer/widgets/latest_teeth_widget.dart';
import 'package:graduation_project/report_module/presentation_layer/widgets/vaccination_info_widget.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../medication_reminder_module/presentation_layer/Screens/no_internet_screen.dart';
import '../../../prescription_module/presentation_layer/widgets/no_data_widget.dart';
import '../widgets/disease_info_widget.dart';
import '../widgets/latest_development_widget.dart';
import '../widgets/latest_growth_widget.dart';
import '../widgets/personal_info_widget.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ReportCubit>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: StreamBuilder<Object>(
            stream: InternetConnectionChecker().onStatusChange,
            builder: (context, snapshot) {
              if (cubit.allVaccinationReport == null) {
                BlocProvider.of<ReportCubit>(context)
                  ..vaccinationReports()
                  ..diseaseReports()
                  ..latesttDevelopment()
                  ..latesttTeeth()
                  ..medicalsInfo()
                  ..getLatestGrowthOfChild();
              }
              if (cubit.allVaccinationReport == null &&
                  snapshot.data == InternetConnectionStatus.disconnected) {
                return const NoInternetScreen();
              } else {
                return BlocConsumer<ReportCubit, ReportState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      {
                        return SafeArea(
                          child: SingleChildScrollView(
                            child: cubit.allDiseaseReport != null &&
                                    cubit.allDiseaseReport!.isEmpty &&
                                    cubit.allVaccinationReport != null &&
                                    cubit.allVaccinationReport!.isEmpty &&
                                    cubit.medicalInfo == null &&
                                    cubit.latestTeeth == null &&
                                    cubit.allDiseaseReport != null &&
                                    cubit.allDiseaseReport!.isEmpty &&
                                    cubit.growth == null
                                ? const NoDataWidget(
                                    image: AppImages.noReportsImage,
                                    text: AppStrings.noReports,
                                    isReport: true,
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(
                                      top: 32.h,
                                      left: 24.w,
                                      right: 16.w,
                                    ),
                                    child: Column(
                                      children: [
                                        state is MedicalInfoLoadingState
                                            ? const CustomCircularProgress()
                                            : cubit.medicalInfo != null
                                                ? PersonalInfoWidget(
                                                    medicalInfoModel:
                                                        cubit.medicalInfo!)
                                                : const SizedBox(),
                                        state is GetLatestGrowthLoadingSatate
                                            ? const CustomCircularProgress()
                                            : cubit.growth != null
                                                ? LatestGrowthWidget(
                                                    growth: cubit.growth!)
                                                : const SizedBox(),
                                        state is LatestDevelopmentLoadingState
                                            ? const CustomCircularProgress()
                                            : cubit.latestDevelopment != null &&
                                                    cubit.latestDevelopment!
                                                        .question.isNotEmpty
                                                ? LatestDevelopmentWidget(
                                                    latestDevelopmentModel:
                                                        cubit
                                                            .latestDevelopment!)
                                                : const SizedBox(),
                                        state is LatestTeethLoadingState
                                            ? const CustomCircularProgress()
                                            : cubit.latestTeeth != null
                                                ? LatestTeethWidget(
                                                    latestTeethModel:
                                                        cubit.latestTeeth!)
                                                : const SizedBox(),
                                        state is VaccinationReportLoadingState
                                            ? const CustomCircularProgress()
                                            : cubit.allVaccinationReport !=
                                                        null &&
                                                    cubit.allVaccinationReport!
                                                        .isNotEmpty
                                                ? VaccineInfoWidget(
                                                    vaccinationReportModel: cubit
                                                        .allVaccinationReport!)
                                                : const SizedBox(),
                                        state is DiseaseReportLoadingState
                                            ? const CustomCircularProgress()
                                            : cubit.allDiseaseReport != null &&
                                                    cubit.allDiseaseReport!
                                                        .isNotEmpty
                                                ? DiseaseInfoWidget(
                                                    diseaseReportModel:
                                                        cubit.allDiseaseReport!)
                                                : const SizedBox(),
                                      ],
                                    ),
                                  ),
                          ),
                        );
                      }
                    });
              }
            }),
      ),
    );
  }
}
