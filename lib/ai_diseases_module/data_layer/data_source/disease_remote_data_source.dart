import 'package:graduation_project/ai_diseases_module/data_layer/models/disease_model.dart';
import 'package:graduation_project/ai_diseases_module/domain_layer/entities/disease.dart';

import '../../../core/utils/exports.dart';

abstract class BaseDiseaseRemoteDataSource {
  /// medical tests
  Future<GeneralModel> storeAiDisease(DiseaseParameters parameters);
  Future<List<AiDisease>> getAiDisease();
  Future<GeneralModel> deleteAiDisease(int id);
  Future<String> predictDisease(PredictDiseaseParameters parameters);
}

class DiseaseRemoteDataSource implements BaseDiseaseRemoteDataSource {
  Dio? dio;
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2JhYnktaGVhbHRoLWNhcmUuc29uaWNhci50ZWNoL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjgwODIxMzgxLCJuYmYiOjE2ODA4MjEzODEsImp0aSI6ImxJbFNuU1NEQ1lGOERlekQiLCJzdWIiOiIyIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.8FI98FIdeduQZmJEVlk7sW5BfcEB4Kxjq6zK9YhrXlk';

  DiseaseRemoteDataSource() {
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
  Future<GeneralModel> deleteAiDisease(int id) async {
    final Response response = await dio!.delete(
      '${AppConstants.deleteAiDisease} $id',
    );
    if (response.data['status'] == true) {
      debugPrint('delete aidisease remote data ${response.data}');
      return GeneralModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<AiDiseaseModel>> getAiDisease() async {
    final Response response = await dio!.get(
      AppConstants.getAilDisease,
    );
    if (response.data['status'] == true) {
      debugPrint('diisease tests  remote data ${response.data}');
      return List<AiDiseaseModel>.from((response.data['data'] as List)
          .map((disease) => AiDiseaseModel.fromJson(disease))
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<GeneralModel> storeAiDisease(DiseaseParameters parameters) async {
    FormData data = FormData.fromMap({
      'prediction': parameters.prediction,
      'disease': parameters.disease,
      "photo": parameters.photo == null
          ? null
          : await MultipartFile.fromFile(
              parameters.photo!,
            ),
    });
    final Response response = await dio!.post(
      AppConstants.storeAiDisease,
      data: data,
    );

    if (response.data['status'] == true) {
      debugPrint('store medical test  remote data ${response.data}');
      return GeneralModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<String> predictDisease(PredictDiseaseParameters parameters) async {
    FormData data = FormData.fromMap({
      "fileup": await MultipartFile.fromFile(
        parameters.photo,
      ),
    });
    final Response response = await dio!.post(
      '${AppConstants.aiBaseUrl}${AppConstants.skin}',
      data: data,
    );

    //if (response.data['status'] == true) {
    debugPrint('predict  remote data ${response.data['prediction']}');
    return response.data['prediction'];
    /*  } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    } */
  }
}
