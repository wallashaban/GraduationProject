import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/vaccinations_module/data_layer/models/vaccination_model.dart';
import 'package:graduation_project/vaccinations_module/domain_layer/entities/vaccination.dart';

import 'package:graduation_project/vaccinations_module/domain_layer/use_cases/attatch_vaccination_use_case.dart';
import 'package:graduation_project/vaccinations_module/domain_layer/use_cases/get_all_vaccination_use_case.dart';
import 'package:graduation_project/vaccinations_module/domain_layer/use_cases/get_single_vaccination_use_case.dart';
import 'package:graduation_project/vaccinations_module/domain_layer/use_cases/stop_or_active_vaccination_use_case.dart';

import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
import '../../../medical_details_module/data_layer/models/general_model.dart';
import '../../../medical_details_module/domain_layer/entites/general.dart';

part 'vaccinations_state.dart';

class VaccinationsCubit extends Cubit<VaccinationsState> {
  final GetAllVaccinationUseCase getAllVaccinationUseCase;
  final GetSingleVaccinationUseCase getSingleVaccinationUseCase;
  final AttachVaccinationUseCase attachVaccinationUseCase;
  final StopOrActiveVaccinationUseCase stopOrActiveVaccinationUseCase;
  VaccinationsCubit(
    this.getAllVaccinationUseCase,
    this.getSingleVaccinationUseCase,
    this.attachVaccinationUseCase,
    this.stopOrActiveVaccinationUseCase,
  ) : super(VaccinationsInitial());

  General general = const GeneralModel(
    data: 'data',
    message: 'message',
    status: false,
  );
  Failure serverFailure = const ServerFailure(
    message: 'message',
  );

  List<Vaccination> allVaccinations = [];
  Vaccination vaccination = const VaccinationModel(
    id: 1,
    name: 'name',
    vaccineAge: 'vaccineAge',
    prevention: 'prevention',
    status: 0,
    proposedVaccinationDate: 'proposedVaccinationDate',
  );


  Future getAllVaccinations() async {
    emit(GetAllVaccinationsLoadingState());
    final result = await getAllVaccinationUseCase(const NoParameters());

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error vaccination ${l.message.toString()}');
        emit(
          GetAllVaccinationsErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        allVaccinations = r;
        emit(GetAllVaccinationsSuccessState());
      },
    );

  }

  Future getSingleVaccination(int id) async {
    emit(GetSingleVaccinationLoadingState());
    final result = await getSingleVaccinationUseCase(id);

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error single vacciination ${l.message.toString()}');
        emit(
          GetSingleVaccinationErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        vaccination = r;
        emit(GetSingleVaccinationSuccessState());
      },
    );
  }

  Future attatchVaccination(List ids) async {
    emit(AttatchVaccinationLoadingState());
    final result = await attachVaccinationUseCase(ids);

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error attatch ${l.message.toString()}');
        emit(
          AttatchVaccinationErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        general = r;
        emit(AttatchVaccinationSuccessState());
      },
    );
  }

  Future stopOrActiveVaccination(int status) async {
    emit(StopOrActiveVaccinationLoadingState());
    final result = await stopOrActiveVaccinationUseCase(status);

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error stop ${l.message.toString()}');
        emit(
          StopOrActiveVaccinationErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        general = r;
        emit(StopOrActiveVaccinationSuccessState());
      },
    );
  }
}




