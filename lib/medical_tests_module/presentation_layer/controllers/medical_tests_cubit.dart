

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
      this.deleteMedicalTestUseCase,):super(MedicalTestsInitial());

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
  MediaclTest singleMedicalTest = MediaclTestModel(
    id: 1,
    labName: 'labName',
    type: 'type',
    labDate: 'labDate',
    labFile: File('path'),
  );

  General testDel = const General(
    data: 'data',
    message: 'message',
    status: false,
  );
  Failure serverFailure = const ServerFailure(
    message: 'message',
  );
 
   ///medical tests

  Future storeMedicalTest(MediaclTestParameters parameters) async {
    emit(StoreMedicaltestLoadingState());
    final result = await storeMedicalTestsUseCase(parameters);

    result.fold(
      (l) {
        serverFailure = l;
        emit(
          StoreMedicaltestErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        medicalTest = r;
        emit(StoreMedicaltestSuccessState());
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
        emit(
          UpdateMedicaltestErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        medicalTest = r;
        emit(UpdateMedicaltestSuccessState());
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
      },
    );
  }


}
