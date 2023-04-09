



import '../../../core/utils/exports.dart';



abstract class BaseMedicalRemoteDataSource {
  //medical details
  Future<GeneralModel> storeMedicalDetails(
      StoreMedicalDetailsParameters parameters);
  Future<List<AllergyModel>> getAllAllergies();
  Future<List<DiseaseModel>> getAllSkinDieases();
  Future<List<DiseaseModel>> getAllChronicDieases();
  Future<List<DiseaseModel>> getAllGenticDiease();
}

class MedicalRemoteDataSource implements BaseMedicalRemoteDataSource {
  Dio? dio;
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2JhYnktaGVhbHRoLWNhcmUuc29uaWNhci50ZWNoL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjgwODIxMzgxLCJuYmYiOjE2ODA4MjEzODEsImp0aSI6ImxJbFNuU1NEQ1lGOERlekQiLCJzdWIiOiIyIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.8FI98FIdeduQZmJEVlk7sW5BfcEB4Kxjq6zK9YhrXlk';

  MedicalRemoteDataSource() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    dio = Dio(options);
  }

  @override
  Future<List<AllergyModel>> getAllAllergies() async {
    final Response response = await dio!.get(
      AppConstants.getAllAllergy,
    );
    if (response.data['status'] == true) {
      debugPrint('allegy  remote data ${response.data}');
      return List<AllergyModel>.from((response.data['data'] as List)
          .map((category) => AllergyModel.fromJson(category))
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<DiseaseModel>> getAllChronicDieases() async {
    final Response response = await dio!.get(
      AppConstants.chronicDiseases,
    );
    if (response.data['status'] == true) {
      debugPrint('chronic  remote data ${response.data}');
      return List<DiseaseModel>.from((response.data['data'] as List)
          .map((disease) => DiseaseModel.fromJson(disease))
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<DiseaseModel>> getAllGenticDiease() async {
    final Response response = await dio!.get(
      AppConstants.geneticDieases,
    );
    if (response.data['status'] == true) {
      debugPrint('genetic  remote data ${response.data}');
      return List<DiseaseModel>.from((response.data['data'] as List)
          .map((disease) => DiseaseModel.fromJson(disease))
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<DiseaseModel>> getAllSkinDieases() async {
    final Response response = await dio!.get(
      AppConstants.skinDiseases,
    );
    if (response.data['status'] == true) {
      debugPrint('skin  remote data ${response.data}');
      return List<DiseaseModel>.from((response.data['data'] as List)
          .map((disease) => DiseaseModel.fromJson(disease))
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<GeneralModel> storeMedicalDetails(
      StoreMedicalDetailsParameters parameters) async {
    final Response response =
        await dio!.post(AppConstants.storeMedicalDetails, queryParameters: {
      'blood_type': parameters.bloodType,
      'allergy': parameters.allergy,
      'chronic_disease': parameters.chronicDisease,
      'genetic_disease': parameters.genticDisease,
      'is_medicine': parameters.isMedicine,
      'medicine_file': parameters.medicineFile,
    });
    if (response.data['status'] == true) {
      debugPrint('store medical details  remote data ${response.data}');
      return GeneralModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
