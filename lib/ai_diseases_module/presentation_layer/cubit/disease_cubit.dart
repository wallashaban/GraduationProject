// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:file_picker/file_picker.dart';
import 'package:graduation_project/ai_diseases_module/domain_layer/entities/disease.dart';

import 'package:graduation_project/ai_diseases_module/domain_layer/use_cases/delete_ai_sisease_use_case.dart';
import 'package:graduation_project/ai_diseases_module/domain_layer/use_cases/get_ai_sisease_use_case.dart';
import 'package:graduation_project/ai_diseases_module/domain_layer/use_cases/predict_disease_use_case.dart';
import 'package:graduation_project/ai_diseases_module/domain_layer/use_cases/store_ai_sisease_use_case.dart';
import 'package:graduation_project/core/utils/exports.dart';
import 'package:image_picker/image_picker.dart';

part 'disease_state.dart';

class DiseaseCubit extends Cubit<DiseaseState> {
  StoreAiDiseaseUseCase storeAiDiseaseUseCase;
  DeleteAiDiseaseUseCase deleteAiDiseaseUseCase;
  GetAiDiseaseUseCase getAiDiseaseUseCase;
  PredictDiseaseUseCase predictDiseaseUseCase;
  DiseaseCubit(
    this.storeAiDiseaseUseCase,
    this.deleteAiDiseaseUseCase,
    this.getAiDiseaseUseCase,
    this.predictDiseaseUseCase,
  ) : super(DiseaseInitial());

  General diseasedel = const GeneralModel(
    data: 'data',
    message: 'message',
    status: false,
  );
  General diseaseStore = const GeneralModel(
    data: 'data',
    message: 'message',
    status: false,
  );
  List<AiDisease> allDiseases = [];
  Failure serverFailure = const ServerFailure(message: 'message');
  String? disease;
  FilePickerResult? result;
  File? file;
  String? filePath;
  var pickedFile;
  final picker = ImagePicker();
  bool isGallery = false;
  Future pickImageFromCamera() async {
    debugPrint('befor');
    pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      file = File(pickedFile.path);
      filePath = file!.path;
      debugPrint('picked file ${filePath!}');
    }
    isGallery = false;
    emit(PickDiseaseImageSuccessState());
    emit(DiseaseDone());
  }

  Future pickImageFromGallery() async {
    debugPrint('befor');
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      file = File(pickedFile.path);
      filePath = file!.path;
      debugPrint('picked file ${filePath!}');
    }
    isGallery = true;
    emit(PickDiseaseImageSuccessState());
    emit(DiseaseDone());
  }

  deleteImage() {
    pickedFile = null;
    file = filePath = null;
    emit(DeleteImageSuccessState());
  }

  Future storeAiDisease(DiseaseParameters parameters) async {
    emit(StoreDiseaseLoadingState());
    final result = await storeAiDiseaseUseCase(parameters);

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error disease $l');
        emit(
          StoreDiseaseErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        diseaseStore = r;
        emit(StoreDiseaseSuccessState());
        getAllAiDiseases();
        //pickedFile = null;
      },
    );
  }

/////////////////////////////////
  Future getAllAiDiseases() async {
    emit(GetAllDiseaseLoadingState());
    final result = await getAiDiseaseUseCase(const NoParameters());

    result.fold(
      (l) {
        serverFailure = l;
        emit(
          GetAllDiseaseErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        allDiseases = r;
        emit(GetAllDiseaseSuccessState());
      },
    );
  }

  Future deleteAiDisease(int id) async {
    emit(DeleteDiseaseLoadingState());
    final result = await deleteAiDiseaseUseCase(id);

    result.fold(
      (l) {
        serverFailure = l;
        emit(
          DeleteDiseaseErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        diseasedel = r;
        emit(DeleteDiseaseSuccessState());
        getAllAiDiseases();
      },
    );
  }

  Future predictDisease(PredictDiseaseParameters parameters) async {
    emit(PredictDiseaseLoadingState());
    await predictDiseaseUseCase(parameters).then((value) {
      disease = value;
      debugPrint('result $disease');
      emit(PredictDiseaseSuccessState());
    }).catchError((error) {
      emit(
        PredictDiseaseErrorState(
          error: error.toString(),
        ),
      );
      debugPrint('error disease${error.toString()}');
    });
  }
}
