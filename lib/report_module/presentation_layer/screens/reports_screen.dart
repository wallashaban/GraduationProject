// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/authentication_module/presentaion_layer/widgets/cutom_circular.dart';
import 'package:graduation_project/core/utils/app_strings.dart';
import 'package:graduation_project/report_module/presentation_layer/controllers/report_cubit.dart';
import 'package:graduation_project/report_module/presentation_layer/controllers/report_state.dart';
import 'package:graduation_project/report_module/presentation_layer/widgets/latest_teeth_widget.dart';
import 'package:graduation_project/report_module/presentation_layer/widgets/vaccination_info_widget.dart';
import '../../../authentication_module/presentaion_layer/widgets/custom_text.dart';
import '../widgets/disease_info_widget.dart';
import '../widgets/latest_development_widget.dart';
import '../widgets/personal_info_widget.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ReportCubit>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: BlocConsumer<ReportCubit, ReportState>(
          listener: (context, state) {},
          builder: (context, state) => SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15.r),
                child: BlocBuilder<ReportCubit, ReportState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        state is MedicalInfoLoadingState?
                        const CustomCircularProgress():
                        
                        cubit.medicalInfo != null?
                          PersonalInfoWidget(
                              medicalInfoModel: cubit.medicalInfo!):const SizedBox(),
                       state is LatestDevelopmentLoadingState?
                        const CustomCircularProgress():cubit.latestDevelopment != null?
                          LatestDevelopmentWidget(
                              latestDevelopmentModel: cubit.latestDevelopment!):const SizedBox(),
                       state is LatestTeethLoadingState?
                        const CustomCircularProgress():cubit.latestTeeth != null?
                          LatestTeethWidget(
                              latestTeethModel: cubit.latestTeeth!):const SizedBox(),
                      state is VaccinationReportLoadingState?
                        const CustomCircularProgress():  VaccineInfoWidget(
                            vaccinationReportModel: cubit.allVaccinationReport),
                       state is DiseaseReportLoadingState?
                        const CustomCircularProgress(): DiseaseInfoWidget(
                            diseaseReportModel: cubit.allDiseaseReport),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
