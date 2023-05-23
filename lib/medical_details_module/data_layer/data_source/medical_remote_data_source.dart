import '../../../core/utils/exports.dart';
import '../models/medical_Details_model.dart';

abstract class BaseMedicalRemoteDataSource {
  //medical details
  Future<MedicalDetailsModel> storeMedicalDetails(
      StoreMedicalDetailsParameters parameters);
  Future<MedicalDetailsModel> updateMedicalDetails(
      StoreMedicalDetailsParameters parameters);
}

class MedicalRemoteDataSource implements BaseMedicalRemoteDataSource {
  Dio? dio;

  MedicalRemoteDataSource() {
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
      'medicine_file': parameters.medicineName,
      'skin_disease': parameters.skinDisease,
    });
    final Response response = await dio!.post(
      AppConstants.storeMedicalDetails,
      data: data,
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
      'medicine_file': parameters.medicineName,
      'skin_disease': parameters.skinDisease,
    });
    final Response response = await dio!.post(
      AppConstants.updateMedicalDetails,
      data: data,
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
}
