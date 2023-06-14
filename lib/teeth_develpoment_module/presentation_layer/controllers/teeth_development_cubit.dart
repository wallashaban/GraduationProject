import 'package:graduation_project/core/caching_data/teeth_cach%20.dart';
import 'package:graduation_project/teeth_develpoment_module/domain_layer/use_cases/get_medical_teeth_use_case.dart';

import '../../../core/utils/exports.dart';
import '../../data_layer/models/teeth_model.dart';
import '../../domain_layer/entities/medical_teeth.dart';
import '../../domain_layer/entities/teeth.dart';

part 'teeth_development_state.dart';

class TeethDevelopmentCubit extends Cubit<TeethDevelopmentState> {
  ///teeth development
  final StoreTeethDevelopmentUseCase storeTeethDevelopmentUseCase;
  final GetTeethUseCase getTeethUseCase;
  final GetSingleToothUseCase getSingleToothUseCase;
  final UpdateTeethDevelopmentUseCase updateTeethDevelopmentUseCase;
  final DeleteTeethUseCase deleteTeethUseCase;
  final GetMedicalTeethUseCase getMedicalTeethUseCase;
  TeethDevelopmentCubit(
    this.storeTeethDevelopmentUseCase,
    this.getTeethUseCase,
    this.getSingleToothUseCase,
    this.updateTeethDevelopmentUseCase,
    this.deleteTeethUseCase,
    this.getMedicalTeethUseCase,
  ) : super(TeethDevelopmentInitial());

  ///teeth development
  Teeth? teethDev;
  List<MedicalTeeth> medicalTeeth = [];
  Teeth teeth = const TeethModel(
    id: 1,
    apperenceDate: 'apperenceDate',
    ageInYears: 1,
    ageInMonths: 1,
    ageInDays: 'ageInDays',
    teethName: 'teethName',
  );
  List<Teeth>? allTeeth;
  General teethDel = const GeneralModel(
    data: 'data',
    message: 'message',
    status: false,
  );

  Failure serverFailure = const ServerFailure(
    message: 'message',
  );
  String date = '2023-01-01';
  changeDate(String date) {
    this.date = date;
    emit(ChangeDateTeethState());
    emit(TeethDone());
  }

  ////////////////////
  List<String> teethList = [
    "قاطع مركزي علوي ايمن A",
    "قاطع مركزي علوي ايسر A",
    "قاطع مركزي سفلي ايسر A",
    "قاطع مركزي سفلي ايمن A",
    "قاطع جانبي علوي أيمن B",
    "قاطع جانبي علوي ايسر B",
    "قاطع جانبي سفلي أيمن B",
    "قاطع جانبي سفلي ايسر B",
    "ضرس أول علوي أيمن C",
    "ضرس أول علوي أيسر C",
    "ضرس أول سفلي أيمن C",
    "ضرس أول سفلي ايسر C",
    "ناب أول علوي أيمن D",
    "ناب أول علوي ايسر D",
    "ناب أول سفلي أيمن D",
    "ناب أول سفلي ايسر D",
    "ضرس ثاني علوي أيمن E",
    "ضرس ثاني علوي ايسر E",
    "ضرس ثاني سفلي أيمن E",
    "ضرس ثاني سفلي ايسر E",
  ];
  String? toothName;
  int? toothId;
  getToothId(int toothId) {
    this.toothId = toothId;
    debugPrint('tooth id$toothId');
    emit(TeethDone());
  }

  void changeToothNameValue(String toothName) {
    this.toothName = toothName;
    emit(ChangeToothNameValueState());
    emit(TeethDone());
  }

  // getData() async {
  //   final data = Hive.box('teethCach').keys.map((e) {

  //   });
  // }

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
        //debugPrint('hive ${Hive.box('teethCach').get('teeth ${r.id}')}');
        debugPrint('userdata del ${userDataCach.id}');
        Hive.box('teethCach').put(
          'teeth ${r.id} ${userDataCach.id}',
          TeethCach(
            id: r.id,
            teeth: r.teethName,
            appearanceDate: r.apperenceDate,
            ageInMonth: r.ageInMonths.toString(),
            ageInYears: r.ageInYears.toString(),
          ),
        );
        emit(StoreTeethSuccessState());
        // getAllteeth();
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
        debugPrint('all teeth $allTeeth');
        emit(GellAllTeethSuccessState());
      },
    );
  }

  Future getMedicalTeeth() async {
    emit(GetMedicalTeethLoadingState());
    final result = await getMedicalTeethUseCase(const NoParameters());

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('all teeth error $l');
        emit(
          GetMedicalTeethErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        medicalTeeth = r;
        debugPrint('all teeth $allTeeth');
        emit(GetMedicalTeethSuccessState());
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
        debugPrint('all teeth error $l');
        emit(
          UpdateTeethErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        teethDev = r;
        debugPrint('userdata del ${userDataCach.id}');
        Hive.box('teethCach').put(
          'teeth ${r.id} ${userDataCach.id}',
          TeethCach(
            id: r.id,
            teeth: r.teethName,
            appearanceDate: r.apperenceDate,
            ageInMonth: r.ageInMonths.toString(),
            ageInYears: r.ageInYears.toString(),
          ),
        );
        emit(UpdateTeethSuccessState());
      },
    );
  }

/////////////////////////////////////////
  Future deleteTooth(int id) async {
    emit(DeleteTeethLoadingState());
    final result = await deleteTeethUseCase(id);
    //Hive.box('teethCach').deleteAll(Hive.box('teethCach').keys);
    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('teeth error $l');
        emit(
          DeleteTeethErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        teethDel = r;
        debugPrint('userdata del ${userDataCach.id}');

        Hive.box('teethCach').delete('teeth $id ${userDataCach.id}');
        //Hive.box('teethCach').delete('teeth $id ${userDataCach.id}');
        emit(DeleteTeethSuccessState());
        // getAllteeth();
      },
    );
  }
}
