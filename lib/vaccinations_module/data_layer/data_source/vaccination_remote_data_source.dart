import '../../../core/utils/dio_helper.dart';
import '../models/vaccination_model.dart';

import '../../../core/utils/exports.dart';

abstract class BaseVaccinationRemoteDataSource {
  Future<List<VaccinationModel>> getAllVaccination();
  Future<VaccinationModel> getSingleVaccination(int id);
  Future<GeneralModel> attatchVaccination(int ids);
  Future<GeneralModel> stopOrActiveVaccination(int status);
}

class VaccinationRemoteDataSource implements BaseVaccinationRemoteDataSource {
  Dio? dio;

  VaccinationRemoteDataSource() {
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
  Future<GeneralModel> attatchVaccination(int ids) async {
    final Response response = await DioHelper.postData(url: AppConstants.attatchVaccination,
        query: {'vaccination_id': ids},token: CashHelper.getData(key: 'token'),);
    if (response.data['status'] == true) {
      debugPrint('attatch vaccination details  remote data ${response.data}');
      return GeneralModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<VaccinationModel>> getAllVaccination() async {
    final Response response = await DioHelper.getData(url:
      AppConstants.getAllVaccinations,
      bearerToken: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('all reminders  remote data ${response.data}');
      return List<VaccinationModel>.from((response.data['data'] as List)
          .map((reminder) => VaccinationModel.fromJson(reminder))
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<VaccinationModel> getSingleVaccination(int id) async {
    final Response response = await DioHelper.getData(url:
      '${AppConstants.getSingleVaccination}$id',
      bearerToken: CashHelper.getData(key: 'token')
    );
    if (response.data['status'] == true) {
      debugPrint('single vaccination   remote data ${response.data}');
      return VaccinationModel.fromJson(response.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<GeneralModel> stopOrActiveVaccination(int status) async {
    final Response response =
        await DioHelper.postData(url:AppConstants.stopOrActiveVaccination, query: {
      'status': status,token:CashHelper.getData(key: 'token'),
    });
    if (response.data['status'] == true) {
      debugPrint('stop vaccination   remote data ${response.data}');
      return GeneralModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
