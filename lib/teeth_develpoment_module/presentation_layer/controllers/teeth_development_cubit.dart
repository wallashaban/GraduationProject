import '../../../core/utils/exports.dart';
import '../../data_layer/models/teeth_model.dart';
import '../../domain_layer/entities/teeth.dart';

part 'teeth_development_state.dart';

class TeethDevelopmentCubit extends Cubit<TeethDevelopmentState> {
  ///teeth development
  final StoreTeethDevelopmentUseCase storeTeethDevelopmentUseCase;
  final GetTeethUseCase getTeethUseCase;
  final GetSingleToothUseCase getSingleToothUseCase;
  final UpdateTeethDevelopmentUseCase updateTeethDevelopmentUseCase;
  final DeleteTeethUseCase deleteTeethUseCase;
  TeethDevelopmentCubit(
    this.storeTeethDevelopmentUseCase,
    this.getTeethUseCase,
    this.getSingleToothUseCase,
    this.updateTeethDevelopmentUseCase,
    this.deleteTeethUseCase,
  ) : super(TeethDevelopmentInitial());

  ///teeth development
  General teethDev = const General(
    data: 'data',
    message: 'message',
    status: false,
  );
  Teeth teeth = const TeethModel(
    id: 1,
    apperenceDate: 'apperenceDate',
    ageInYears: 'ageInYears',
    ageInMonths: 'ageInMonths',
    ageInDays: 'ageInDays',
    teethName: 'teethName',
  );
  List<Teeth> allTeeth = [];
  General teethDel = const GeneralModel(
    data: 'data',
    message: 'message',
    status: false,
  );

  Failure serverFailure = const ServerFailure(
    message: 'message',
  );
  ////////////////////
  List<String> teethList = [
    'A',
    'B',
    'C',
    'D',
    'E',
  ];
  String? toothName;
  int? toothId;
  void getToothId(int toothId) {
    this.toothId = toothId;
    debugPrint('tooth id$toothId');
    emit(TeethDone());
  }

  void changeBloodTypeValue(String toothName) {
    this.toothName = toothName;
    emit(ChangeToothNameValueState());
    emit(TeethDone());
  }

  //teeth development
  Future storeTeethDevelopment(TeethParameters parameters) async {
    emit(StoreTeethLoadingState());
    final result = await storeTeethDevelopmentUseCase(parameters);

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('teeth error $l');
        emit(
          StoreTeethErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        teethDev = r;
        emit(StoreTeethSuccessState());
        getAllteeth();
      },
    );
  }
///////////////////////////////////////////

  Future getAllteeth() async {
    emit(GellAllTeethLoadingState());
    final result = await getTeethUseCase(const NoParameters());

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('all teeth error $l');
        emit(
          GellAllTeethErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        allTeeth = r;
        emit(GellAllTeethSuccessState());
      },
    );
  }

///////////////////////////////////
  Future getSingleTooth(int id) async {
    emit(GetSingleTeethLoadingState());
    final result = await getSingleToothUseCase(id);

    result.fold(
      (l) {
        serverFailure = l;
        emit(
          GetSingleTeethErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        teeth = r;
        emit(GetSingleTeethSuccessState());
      },
    );
  }

/////////////////////////////////////////
  Future updateTooth(TeethParameters parameters) async {
    emit(UpdateTeethLoadingState());
    final result = await updateTeethDevelopmentUseCase(parameters);

    result.fold(
      (l) {
        serverFailure = l;
        emit(
          UpdateTeethErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        teethDev = r;
        emit(UpdateTeethSuccessState());
      },
    );
  }

/////////////////////////////////////////
  Future deleteTooth(int id) async {
    emit(DeleteTeethLoadingState());
    final result = await deleteTeethUseCase(id);

    result.fold(
      (l) {
        serverFailure = l;
        emit(
          DeleteTeethErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        teethDel = r;
        emit(DeleteTeethSuccessState());
        getAllteeth();
      },
    );
  }
}
