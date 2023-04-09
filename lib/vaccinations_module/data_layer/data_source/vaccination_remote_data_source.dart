import 'package:graduation_project/vaccinations_module/data_layer/models/vaccination_model.dart';

import '../../../core/utils/exports.dart';

abstract class BaseVaccinationRemoteDataSource{
  Future< List<VaccinationModel>> getAllVaccination();
  Future< VaccinationModel> getSingleVaccination(int id);
  Future< GeneralModel> attatchVaccination(List ids);
  Future< GeneralModel> stopOrActiveVaccination(int status);
}

class VaccinationRemoteDataSource implements BaseVaccinationRemoteDataSource{
  Dio? dio;

  VaccinationRemoteDataSource() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Accept': 'application/json',
          'token': '',
        });
    dio = Dio(options);
  }
  
  @override
  Future<GeneralModel> attatchVaccination(List ids)async {
    final Response response =
        await dio!.post(AppConstants.attatchVaccination, queryParameters: {
      'vaccination_ids[]':ids
    });
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
  Future<List<VaccinationModel>> getAllVaccination()async {
   final Response response = await dio!.get(
      AppConstants.getAllVaccinations,
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
  Future<VaccinationModel> getSingleVaccination(int id)async {
     final Response response = await dio!.get(
      '${AppConstants.getSingleVaccination}$id',
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
  Future<GeneralModel> stopOrActiveVaccination(int status)async {
   final Response response =
        await dio!.post(AppConstants.stopOrActiveVaccination, queryParameters: {
      'status':status,
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