// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:file_picker/file_picker.dart';
import 'package:graduation_project/core/caching_data/pres_cach.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/utils/exports.dart';

import '../../data_layer/models/prescribtion_model.dart';
import '../../domain_layer/entities/prescribtion.dart';

part 'prescription_state.dart';

class PrescriptionCubit extends Cubit<PrescriptionState> {
  ///prescription
  final StorePrescriptionUseCase storePrescriptionUseCase;
  final GetAllPrescriptionsUseCase getAllPrescriptionsUseCase;
  final GetSinglePrescriptionUseCase getSinglePrescriptionUseCase;
  final UpdatePrescriptionUseCase updatePrescriptionUseCase;
  final DeletePrescriptionUseCase deletePrescriptionUseCase;
  ////////////////////////////////////////////
  PrescriptionCubit(
    this.storePrescriptionUseCase,
    this.getAllPrescriptionsUseCase,
    this.getSinglePrescriptionUseCase,
    this.updatePrescriptionUseCase,
    this.deletePrescriptionUseCase,
  ) : super(PrescriptionInitial());

  ///prescription
  Presccription? prescription;
  List<Presccription> allPrescriptions = [];
  Presccription singlePrescription = const PrescribtionModel(
    id: 1,
    note: 'note',
    date: 'date',
    file: '',
  );
  Presccription prescriptionUpdated = const PrescribtionModel(
    id: 1,
    note: 'note',
    date: 'date',
    file: '',
  );
  General prescriptionDel = const General(
    data: 'data',
    message: 'message',
    status: false,
  );
  ///////////////////////////////
  Failure serverFailure = const ServerFailure(
    message: 'message',
  );
  void canselPickedFile() {
    pickedFile = null;
    filePath = null;
    emit(CanselPres());
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
      debugPrint('picked file ${file!.existsSync()}');
    }
    emit(PickImageState());
    emit(PrescriptionDone());
  }

  ///prscription

  Future storePrescription(PresccriptionParameters parameters) async {
    emit(StorePrescriptionLoadingState());
    final result = await storePrescriptionUseCase(parameters);

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error $l');
        emit(
          StorePrescriptionErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        prescription = r;
        Hive.box('presCach').put(
          'pres ${r.id} ${CashHelper.getData(key: 'id').toString()}',
          PresCach(
            id: r.id,
            date: r.date,
            file: r.file,
            note: r.note,
          ),
        );
        debugPrint('pres id ${CashHelper.getData(key: 'id')}');
        emit(StorePrescriptionSuccessState());
        //getAllPrescriiptions();
      },
    );
  }

///////////////////////////////////////////

  Future getAllPrescriiptions() async {
    emit(GellAllPrescriptionLoadingState());
    final result = await getAllPrescriptionsUseCase(const NoParameters());

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error $l');
        emit(
          GellAllPrescriptionErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        allPrescriptions = r;
        emit(GellAllPrescriptionSuccessState());
      },
    );
  }

  ////////////////////////////////////
  Future getSinglePrescription(int id) async {
    emit(GetSinglePrescriptionLoadingState());
    final result = await getSinglePrescriptionUseCase(id);

    result.fold(
      (l) {
        serverFailure = l;
        emit(
          GetSinglePrescriptionErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        singlePrescription = r;
        emit(GetSinglePrescriptionSuccessState());
      },
    );
  }

  Future updatePrescription(PresccriptionParameters parameters) async {
    emit(UpdatePrescriptionLoadingState());
    final result = await updatePrescriptionUseCase(parameters);

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error $l');
        emit(
          UpdatePrescriptionErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        prescriptionUpdated = r;
        Hive.box('presCach').put(
          'pres ${r.id} ${CashHelper.getData(key: 'id').toString()}',
          PresCach(
            id: r.id,
            date: r.date,
            file: r.file,
            note: r.note,
          ),
        );
        emit(UpdatePrescriptionSuccessState());
        // getAllPrescriiptions();
      },
    );
  }
  /////////////////////////////////////////

  Future deletePrescription(int id) async {
    emit(DeletePrescriptionLoadingState());
    final result = await deletePrescriptionUseCase(id);
    //Hive.box('presCach').deleteAll(Hive.box('presCach').keys);
    result.fold(
      (l) {
        serverFailure = l;
        emit(
          DeletePrescriptionErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        prescriptionDel = r;
        Hive.box('presCach')
            .delete('pres $id ${CashHelper.getData(key: 'id').toString()}');
        emit(DeletePrescriptionSuccessState());
        //getAllPrescriiptions();
      },
    );
  }

  /////////////////////////////////////////
}
