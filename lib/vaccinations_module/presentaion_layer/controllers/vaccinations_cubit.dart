import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/vaccinations_module/presentaion_layer/widgets/vaccine_reminder_showmessage.dart';
import '../../data_layer/models/vaccination_model.dart';
import '../../domain_layer/entities/vaccination.dart';

import '../../domain_layer/use_cases/attatch_vaccination_use_case.dart';
import '../../domain_layer/use_cases/get_all_vaccination_use_case.dart';
import '../../domain_layer/use_cases/get_single_vaccination_use_case.dart';
import '../../domain_layer/use_cases/stop_or_active_vaccination_use_case.dart';

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

  List<Vaccination>? allVaccinations;
  Vaccination vaccination = const VaccinationModel(
    id: 1,
    name: 'name',
    vaccineAge: 'vaccineAge',
    prevention: 'prevention',
    status: 0,
    proposedVaccinationDate: 'proposedVaccinationDate',
    about: '',
    important: 0,
    numberOfSyrings: 4,
    sideEffects: '',
    vaccinationDate: '',
  );
  /* getData() {
    if (allVaccinations == null) {
      debugPrint('statement');
      getAllVaccinations();
    }
  } */

  getAllVaccinations() async {
    final result = await getAllVaccinationUseCase(const NoParameters());
    emit(GetAllVaccinationsLoadingState());
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
        debugPrint('all vaccines ${allVaccinations!.length}');
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

  Future attatchVaccination(int ids) async {
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
        getAllVaccinations();
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

  bool isOn = true;
  Future changeToggleStatus() async {
    isOn = !isOn;
    CashHelper.saveData(key: 'reminder', value: isOn);
  }

  Future showMessage(context) async {
    changeToggleStatus().then((value) {
      if (isOn) {
        showMessageComponent(
          context: context,
          isOn: isOn,
        );

        stopOrActiveVaccination(1);
      } else {
        showMessageComponent(context: context, isOn: isOn);
        stopOrActiveVaccination(0);
      }
    });

    emit(ShowMessageSuccessState());
    emit(ChangeDialogSuccessState());
  }
}
