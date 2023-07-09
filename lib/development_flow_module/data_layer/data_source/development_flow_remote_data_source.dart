import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/development_flow_module/data_layer/model/get_all_tips_model.dart';
import 'package:graduation_project/development_flow_module/data_layer/model/get_question_model.dart';

import '../../../core/utils/dio_helper.dart';
import '../model/get_subjects_with_question_model.dart';

abstract class BaseDevelopmentFlowRemoteDataSource {
  Future<List<AllTipsModel>> allTips();
  Future<List<QuestionsOfTipModel>> questionsOfTip(int id);
  Future<List<SubjectWithQuestionsModel>> subjectsWithQuestions();
  Future<GeneralModel> updateTips(UpdateTipsParameters parameters);
  Future<GeneralModel> createTips(List parameters);
}

class DevelopmentFlowRemoteDataSource
    implements BaseDevelopmentFlowRemoteDataSource {
  Dio? dio;
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2JhYnktaGVhbHRoLWNhcmUuc29uaWNhci50ZWNoL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjgzOTIwMzQ0LCJuYmYiOjE2ODM5MjAzNDQsImp0aSI6Im5OWndYWlRtVXRobjFvVDUiLCJzdWIiOiIxNSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.I9bZVvAirgN7egGSGBTBE3s_HxETtYVgU9QQ1F5p4Nw';
  DevelopmentFlowRemoteDataSource() {
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
  Future<List<AllTipsModel>> allTips() async {
    final Response response = await DioHelper.getData(
      url: AppConstants.getAllTips,
      bearerToken: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('allTips   remote data ${response.data}');
      return List<AllTipsModel>.from((response.data['data'])
          .map((e) => AllTipsModel.fromJson(e))
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<GeneralModel> createTips(List parameters) async {
    Map<dynamic, dynamic> data = {
      'answers': parameters,
    };
    final Response response = await DioHelper.postData(
      url: AppConstants.createTips,
      data: data,
      token: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('createTips   remote data ${response.data}');
      return GeneralModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<QuestionsOfTipModel>> questionsOfTip(int id) async {
    final Response response = await DioHelper.getData(
      url: '${AppConstants.questionsOfTips}$id',
      bearerToken: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('questionsOfTip   remote data ${response.data['data']}');
      return List<QuestionsOfTipModel>.from((response.data['data'])
          .map((e) => QuestionsOfTipModel.fromJson(e))
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<GeneralModel> updateTips(UpdateTipsParameters parameters) async {
    Map<dynamic, dynamic> data = {
      'answers': parameters.tips,
    };
    final Response response = await DioHelper.postData(
      url: '${AppConstants.updateTips}${parameters.id}',
      data: data,
      token: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('updateTips   remote data ${response.data}');
      return GeneralModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<SubjectWithQuestionsModel>> subjectsWithQuestions() async {
    final Response response = await DioHelper.getData(
      url: AppConstants.subjectsWithQuestions,
      bearerToken: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('subjectsWithQuestions remote data ${response.data}');
      return List<SubjectWithQuestionsModel>.from(
        (response.data['data'])
            .map((e) => SubjectWithQuestionsModel.fromJson(e))
            .toList(),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
