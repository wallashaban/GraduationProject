import '../../../core/utils/exports.dart';
import '../models/prescribtion_model.dart';

abstract class BasePrescriptionRemotDataSource {
    //prescription

  Future<GeneralModel> storePrescribtion(PresccriptionParameters parameters);
  Future<List<PrescribtionModel>> getAllPrescriptions();
  Future<PrescribtionModel> getSinglePrescription(int id);
  Future<PrescribtionModel> updatePrescription(
      PresccriptionParameters parameters);

  Future<GeneralModel> deletePrescriPtion(int id);
}

class PrescriptionRemoteDataSource implements BasePrescriptionRemotDataSource{
   Dio? dio;
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2JhYnktaGVhbHRoLWNhcmUuc29uaWNhci50ZWNoL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjgwODIxMzgxLCJuYmYiOjE2ODA4MjEzODEsImp0aSI6ImxJbFNuU1NEQ1lGOERlekQiLCJzdWIiOiIyIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.8FI98FIdeduQZmJEVlk7sW5BfcEB4Kxjq6zK9YhrXlk';

  PrescriptionRemoteDataSource() {
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
  Future<GeneralModel> deletePrescriPtion(int id) async {
    final Response response = await dio!.delete(
      '${AppConstants.deletePrescription} $id',
    );
    if (response.data['status'] == true) {
      debugPrint('delete prescription remote data ${response.data}');
      return GeneralModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

 @override
  Future<List<PrescribtionModel>> getAllPrescriptions() async {
    final Response response = await dio!.get(
      AppConstants.getAllPrescriptions,
    );
    if (response.data['status'] == true) {
      debugPrint('prescription  remote data ${response.data}');
      return List<PrescribtionModel>.from((response.data['data'] as List)
          .map((presription) => PrescribtionModel.fromJson(presription))
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
@override
  Future<PrescribtionModel> getSinglePrescription(int id) async {
    final Response response = await dio!.get(
      '${AppConstants.getSinglePrescripton}$id',
    );
    if (response.data['status'] == true) {
      debugPrint(
          'single prescription testremote data ${response.data['data']}');
      return PrescribtionModel.fromJson(response.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
 @override
  Future<GeneralModel> storePrescribtion(
      PresccriptionParameters parameters) async {
        FormData data = FormData.fromMap({
            'note': parameters.note,
      'date': parameters.date,
       "file":
          parameters.file==null?null:   await MultipartFile.fromFile(parameters.file!, ),
    });
    final Response response =
        await dio!.post(AppConstants.storePrescription,
        data: data /* queryParameters: {
      'note': parameters.note,
      'date': parameters.date,
      'file': parameters.file,
    } */
    );
    if (response.data['status'] == true) {
      debugPrint('store prescription details  remote data ${response.data}');
      return GeneralModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
  @override
  Future<PrescribtionModel> updatePrescription(
      PresccriptionParameters parameters) async {
          FormData data = FormData.fromMap({
            'note': parameters.note,
      'date': parameters.date,
     if(parameters.file!=null)  "file":
            await MultipartFile.fromFile(parameters.file!, ),
    });
    final Response response = await dio!.post(
        '${AppConstants.updatePrescription}${parameters.id}',data: data,
        // queryParameters: {
        //   'note': parameters.note,
        //   'date': parameters.date,
        //   'file': parameters.file,
        // },
        );
    if (response.data['status'] == true) {
      debugPrint(
          'update prescription details  remote data ${response.data['data']}');
      return PrescribtionModel.fromJson(response.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

 
}