// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/exports.dart';
import '../../data_layer/models/medical_test_model.dart';

import 'medical_tests_state.dart';

class MedicalTestsCubit extends Cubit<MedicalTestsState> {
  ///medical tests
  final StoreMedicalTestsUseCase storeMedicalTestsUseCase;
  final GetAllAllMedicalTestUseCase getAllAllMedicalTestUseCase;
  final GetSingleMedicalTestUseCase getSingleMedicalTestUseCase;
  final UpdateMedicalTestUseCase updateMedicalTestUseCase;
  final DeleteMedicalTestUseCase deleteMedicalTestUseCase;

  MedicalTestsCubit(
    this.storeMedicalTestsUseCase,
    this.getAllAllMedicalTestUseCase,
    this.getSingleMedicalTestUseCase,
    this.updateMedicalTestUseCase,
    this.deleteMedicalTestUseCase,
  ) : super(MedicalTestsInitial());

  ///medical test
  General medicalTest = const GeneralModel(
    data: 'data',
    message: 'message',
    status: false,
  );

  General updateMedicalTest = const GeneralModel(
    data: 'data',
    message: 'message',
    status: false,
  );

  List<MediaclTest> allMedicalTests = [];
  MediaclTest singleMedicalTest = const MediaclTestModel(
    id: 1,
    labName: 'labName',
    type: 'type',
    labDate: 'labDate',
    labFile: '',
  );

  General testDel = const General(
    data: 'data',
    message: 'message',
    status: false,
  );
  Failure serverFailure = const ServerFailure(
    message: 'message',
  );
  void canselPickedFile() {
    pickedFile = null;
    filePath = null;
    emit(Cansel());
  }

  FilePickerResult? result;
  File? file;
  String? filePath;
  var pickedFile;
  final picker = ImagePicker();
  Future pickImage() async {
    debugPrint('befor');
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      file = File(pickedFile.path);
      filePath = file!.path;
      debugPrint('picked file ${filePath!}');
    }
    emit(PickImageSuccessState());
    emit(TestDone());
  }

  void pickFiles() async {
    result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = result!.files.first as File?;
      debugPrint('file $file');
    }
    emit(PickImageSuccessState());
  }

  ///medical tests

  Future storeMedicalTest(MediaclTestParameters parameters) async {
    emit(StoreMedicaltestLoadingState());
    final result = await storeMedicalTestsUseCase(parameters);

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error $l');
        emit(
          StoreMedicaltestErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        medicalTest = r;
        emit(StoreMedicaltestSuccessState());
        getAllMedicalTests();
        pickedFile = null;
      },
    );
  }

/////////////////////////////////
  Future getAllMedicalTests() async {
    emit(GellAllMedicaltestLoadingState());
    final result = await getAllAllMedicalTestUseCase(const NoParameters());

    result.fold(
      (l) {
        serverFailure = l;
        emit(
          GellAllMedicaltestErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        allMedicalTests = r;
        emit(GellAllMedicaltestSuccessState());
      },
    );
  }

  ////////////////////////////////////
  Future getSingleMedicalTest(int id) async {
    emit(GetSingleMedicaltestLoadingState());
    final result = await getSingleMedicalTestUseCase(id);

    result.fold(
      (l) {
        serverFailure = l;
        emit(
          GetSingleMedicaltestErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        singleMedicalTest = r;
        emit(GetSingleMedicaltestSuccessState());
      },
    );
  }

  /////////////////////////////////////////////
  Future updateMedicalTests(MediaclTestParameters parameters) async {
    emit(UpdateMedicaltestLoadingState());
    final result = await updateMedicalTestUseCase(parameters);

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error $l');
        emit(
          UpdateMedicaltestErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        medicalTest = r;
        emit(UpdateMedicaltestSuccessState());
        getAllMedicalTests();
      },
    );
  }

  ///////////////////////////////////
  Future deleteMedicalTest(int id) async {
    emit(DeleteMedicaltestLoadingState());
    final result = await deleteMedicalTestUseCase(id);

    result.fold(
      (l) {
        serverFailure = l;
        emit(
          DeleteMedicaltestErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        testDel = r;
        emit(DeleteMedicaltestSuccessState());
        getAllMedicalTests();
      },
    );
  }
}
