import '../../../core/utils/dio_helper.dart';
import '../../../core/utils/exports.dart';
import '../models/medical_Details_model.dart';

abstract class BaseMedicalRemoteDataSource {
  //medical details
  Future<MedicalDetailsModel> storeMedicalDetails(
      StoreMedicalDetailsParameters parameters);
  Future<MedicalDetailsModel> updateMedicalDetails(
      StoreMedicalDetailsParameters parameters);
      Future<MedicalDetailsModel> showMedicalDetails();
}

class MedicalRemoteDataSource implements BaseMedicalRemoteDataSource {
  Dio? dio;

  MedicalRemoteDataSource() {
    debugPrint('token details ${token}');
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
  Future<MedicalDetailsModel> storeMedicalDetails(
      StoreMedicalDetailsParameters parameters) async {
    FormData data = FormData.fromMap({
      'blood_type': parameters.bloodType,
      'allergy': parameters.allergy,
      'chronic_disease': parameters.chronicDisease,
      'genetic_disease': parameters.genticDisease,
      'Is_medicine': parameters.isMedicine,
      'skin_disease': parameters.skinDisease,
    });
    final Response response = await DioHelper.postData(
      url: AppConstants.storeMedicalDetails,
      data: data,
      token: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('store medical details  remote data ${response.data}');
      return MedicalDetailsModel.fromJson(response.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MedicalDetailsModel> updateMedicalDetails(
      StoreMedicalDetailsParameters parameters) async {
    FormData data = FormData.fromMap({
      'blood_type': parameters.bloodType,
      'allergy': parameters.allergy,
      'chronic_disease': parameters.chronicDisease,
      'genetic_disease': parameters.genticDisease,
      'Is_medicine': parameters.isMedicine,
      'skin_disease': parameters.skinDisease,
    });
    final Response response = await DioHelper.postData(
      url: AppConstants.updateMedicalDetails,
      data: data,
      token: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('update medical details  remote data ${response.data}');
      return MedicalDetailsModel.fromJson(response.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
  
  @override
  Future<MedicalDetailsModel> showMedicalDetails() async {
    
    final Response response = await DioHelper.getData(
      url: AppConstants.showMedicalDetails,
      bearerToken: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('store medical details  remote data ${response.data}');
      return MedicalDetailsModel.fromJson(response.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
