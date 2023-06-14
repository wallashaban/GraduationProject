import 'package:graduation_project/core/utils/dio_helper.dart';
import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/report_module/data_layer/model/disease_report_model.dart';
import 'package:graduation_project/report_module/data_layer/model/latest_development_model.dart';
import 'package:graduation_project/report_module/data_layer/model/latest_teeth_model.dart';
import 'package:graduation_project/report_module/data_layer/model/medical_info_model.dart';
import 'package:graduation_project/report_module/data_layer/model/vaccination_report_model.dart';

import '../../../growth_module/data_layer/models/growth_model.dart';

abstract class BaseReportRemoteDataSource {
  Future<List<VaccinationReportModel>> vaccinationsReport();
  Future<LatestDevelopmentModel> latestDevelopments();
  Future<MedicalInfoModel> medicalsInfo();
  Future<LatestTeethModel> latestTeeeth();
  Future<List<DiseaseReportModel>> diseasesReport();
    Future<GrowthModel> getLatestGrowthOfChild();

}

class ReportRemoteDataSource implements BaseReportRemoteDataSource {
  Dio? dio;
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2JhYnktaGVhbHRoLWNhcmUuc29uaWNhci50ZWNoL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjgxNTkzMzU4LCJuYmYiOjE2ODE1OTMzNTgsImp0aSI6InBHWGRRa2g2UmtHbTE2SnYiLCJzdWIiOiIxMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.nhTGq_UBowmJ40Sg1JEVOERfS2cluwA3xyK_x6qt2VI';
  ReportRemoteDataSource() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${CashHelper.getData(key: 'token')}',
        });
    dio = Dio(options);
  }

  @override
  Future<List<VaccinationReportModel>> vaccinationsReport() async {
    final Response response = await DioHelper.getData(
      url: AppConstants.vaccinationReport,
      bearerToken: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('vaccinationReport   remote data ${response.data}');
      return List<VaccinationReportModel>.from((response.data['data'])
          .map((e) => VaccinationReportModel.fromJson(e))
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<LatestDevelopmentModel> latestDevelopments() async {
    final Response response = await DioHelper.getData(
      url: AppConstants.latestDevelopment,
      bearerToken: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint(
          'LatestDevelopment   remote data ${response.data}'); //['data']['questions']why not??
      return LatestDevelopmentModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<DiseaseReportModel>> diseasesReport() async {
    final Response response = await DioHelper.getData(
      url: AppConstants.diseaseReport,
      bearerToken: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('DiseaseReport remote data ${response.data}');
      return List<DiseaseReportModel>.from((response.data['data'])
          .map((e) => DiseaseReportModel.fromJson(e))
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<LatestTeethModel> latestTeeeth() async {
    final Response response = await DioHelper.getData(
      url: AppConstants.latestTeeth,
      bearerToken: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('LatestTeeth  remote data ${response.data}');
      return LatestTeethModel.fromJson(response.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MedicalInfoModel> medicalsInfo() async {
    final Response response = await DioHelper.getData(
      url: AppConstants.medicalInfo,
      bearerToken: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('medicalInfo  remote data ${response.data}');
      return MedicalInfoModel.fromJson(response.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
  
  @override
  Future<GrowthModel> getLatestGrowthOfChild() async {
    final Response response = await DioHelper.getData(
      url: AppConstants.latestGrowth,
      bearerToken: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint(
          'LatestDevelopment   remote data ${response.data}'); //['data']['questions']why not??
      return GrowthModel.fromJson(response.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
