import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation_project/prescription_module/domain_layer/use_cases/delete_prescription_use_case.dart';
import 'package:graduation_project/prescription_module/domain_layer/use_cases/update_prescription_use_case.dart';

import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
import '../../../medical_details_module/domain_layer/entites/general.dart';
import '../../data_layer/models/prescribtion_model.dart';
import '../../domain_layer/entities/prescribtion.dart';
import '../../domain_layer/use_cases/get_all_prescriptionss_use_case.dart';
import '../../domain_layer/use_cases/get_single_prescription_use_case.dart';
import '../../domain_layer/use_cases/store_prescription_use_case.dart';

part 'prescription_state.dart';

class PrescriptionCubit extends Cubit<PrescriptionState> {
   ///prescription
  final StorePrescriptionUseCase storePrescriptionUseCase;
  final GetAllPrescriptionsUseCase getAllPrescriptionsUseCase;
  final GetSinglePrescriptionUseCase getSinglePrescriptionUseCase;
  final UpdatePrescriptionUseCase updatePrescriptionUseCase;
  final DeletePrescriptionUseCase deletePrescriptionUseCase;
  ////////////////////////////////////////////
  PrescriptionCubit( this.storePrescriptionUseCase,
    this.getAllPrescriptionsUseCase,
    this.getSinglePrescriptionUseCase,
    this.updatePrescriptionUseCase,
    this.deletePrescriptionUseCase,) : super(PrescriptionInitial());

     ///prescription
  General prescription = const General(
    data: 'data',
    message: 'message',
    status: false,
  );
  List<Presccription> allPrescriptions = [];
  Presccription singlePrescription = PrescribtionModel(
    id: 1,
    note: 'note',
    date: 'date',
    file: File('path'),
  );
  Presccription prescriptionUpdated = PrescribtionModel(
    id: 1,
    note: 'note',
    date: 'date',
    file: File('path'),
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
 

 ///prscription

  Future storePrescription(PresccriptionParameters parameters) async {
    emit(StorePrescriptionLoadingState());
    final result = await storePrescriptionUseCase(parameters);

    result.fold(
      (l) {
        serverFailure = l;
        emit(
          StorePrescriptionErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        prescription = r;
        emit(StorePrescriptionSuccessState());
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
        emit(
          UpdatePrescriptionErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        prescriptionUpdated = r;
        emit(UpdatePrescriptionSuccessState());
      },
    );
  }
  /////////////////////////////////////////

  Future deletePrescription(int id) async {
    emit(DeletePrescriptionLoadingState());
    final result = await deletePrescriptionUseCase(id);

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
        emit(DeletePrescriptionSuccessState());
      },
    );
  }

  /////////////////////////////////////////
 
}
