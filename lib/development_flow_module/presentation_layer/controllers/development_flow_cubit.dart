// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:graduation_project/development_flow_module/domain_layer/entity/all_tips.dart';
import 'package:graduation_project/development_flow_module/domain_layer/entity/get_question.dart';
import 'package:graduation_project/development_flow_module/domain_layer/use_case/create_tips_usecase.dart';
import 'package:graduation_project/development_flow_module/domain_layer/use_case/get_all_tips_usecase.dart';
import 'package:graduation_project/development_flow_module/domain_layer/use_case/get_questions_usecase.dart';
import 'package:graduation_project/development_flow_module/domain_layer/use_case/get_subjects_with_question_usecase.dart';
import 'package:graduation_project/development_flow_module/domain_layer/use_case/update_tips_usecase.dart';
import 'package:graduation_project/development_flow_module/presentation_layer/controllers/development_flow_state.dart';
import '../../../core/utils/exports.dart';
import '../../domain_layer/entity/subject_questions.dart';

class DevelopmentFlowCubit extends Cubit<DevelopmentFlowState> {
  final AllTipsUseCase allTipsUseCase;
  final QuestionsOfTipUseCase questionsOfTipUseCase;
  final SubjectsWithQuestionsUseCase subjectsWithQuestionsUseCase;
  final UpdateTipsUseCase updateTipsUseCase;
  final CreateTipsUseCase createTipsUseCase;
  DevelopmentFlowCubit(
    this.allTipsUseCase,
    this.questionsOfTipUseCase,
    this.subjectsWithQuestionsUseCase,
    this.updateTipsUseCase,
    this.createTipsUseCase,
  ) : super(DevelopmentFlowInitialState());

  bool check = false;
  General general = const GeneralModel(
    message: 'message',
    data: null,
    status: false,
  );
  Failure serverFailure = const ServerFailure(
    message: 'message',
  );

  List<AllTips>? allTips;
  List<QuestionsOfTip>? questionsOfTip;
  List<SubjectWithQuestion>? subjectWithQuestion;

  Future toGetAllTips() async {
    emit(AllTipsLoadingState());
    final result = await allTipsUseCase(const NoParameters());
    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error stop ${l.message.toString()}');
        emit(
          AllTipsErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        allTips = r;
        emit(AllTipsSuccessState());
      },
    );
  }

  List<TipsParameters> tipsParametersQuestions = [];

  Future allQuestionsOfTips(int id) async {
    emit(QuestionsOfTipsLoadingState());
    final result = await questionsOfTipUseCase(id);
    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error stop ${l.message.toString()}');
        emit(
          QuestionsOfTipsErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        questionsOfTip = r;
        r.forEach(
          (element) {
            tipsParametersQuestions += [
              TipsParameters(questionId: element.id, status: element.status),
            ];
          },
        );
        emit(QuestionsOfTipsSuccessState());
      },
    );
  }

  List<TipsParameters> tipsParameters = [];
  Future getSubjectsWithQuestions() async {
    emit(SubjectsWithQuestionsLoadingState());
    final result = await subjectsWithQuestionsUseCase(const NoParameters());
    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error stop ${l.message.toString()}');
        emit(
          SubjectsWithQuestionsErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        subjectWithQuestion = r;
        r.forEach(
          (element) {
            tipsParameters += [
              TipsParameters(questionId: element.id, status: element.status),
            ];
          },
        );
        debugPrint('subject cubit $subjectWithQuestion');
        emit(SubjectsWithQuestionsSuccessState());
      },
    );
  }

  Future createTips(List parameters) async {
    emit(CreateTipsLoadingState());
    final result = await createTipsUseCase(parameters);
    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error stop ${l.message.toString()}');
        emit(
          CreateTipsErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        general = r;
        toGetAllTips();
        emit(CreateTipsSuccessState());
      },
    );
  }

  Future updateTips(UpdateTipsParameters parameters) async {
    emit(UpdateTipsLoadingState());
    final result = await updateTipsUseCase(parameters);
    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error stop ${l.message.toString()}');
        emit(
          UpdateTipsErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        general = r;
        allQuestionsOfTips(parameters.id);
        toGetAllTips();
        emit(UpdateTipsSuccessState());
      },
    );
  }
}
