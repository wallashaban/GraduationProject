// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/settings_notifications_module/presentation_layer/screens/notifications_screen.dart';

import '../../../report_module/presentation_layer/screens/reports_screen.dart';
import '../../../settings_notifications_module/presentation_layer/screens/settings_screen.dart';

part 'medical_state.dart';

class MedicalCubit extends Cubit<MedicalState> {
  //medical details
  final StoreMedicalDetailsUseCase storeMedicalDetailsUseCase;
  final GetAllAllergiesUseCase getAllAllergiesUseCase;
  final GetAllGeneticUseCase getAllGeneticUseCase;
  final GetAllChronicDiseasesUseCase getAllChronicDiseasesUseCase;
  final GetAllSkinDiseasesUseCase getAllSkinDiseasesUseCase;
  /////////////////////////////////

  ///////////////////////////

  MedicalCubit(
    this.storeMedicalDetailsUseCase,
    this.getAllAllergiesUseCase,
    this.getAllGeneticUseCase,
    this.getAllChronicDiseasesUseCase,
    this.getAllSkinDiseasesUseCase,
  ) : super(MedicalInitial());
  // mediical details

  List<Widget> screens = [
    const HomeScreen(),
    const NotificationsScreen(),
    const ReportsScreen(),
    const SettingsScreen(),
  ];
  int currentIndex = 0;
  void changeNavbar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavbatState());
    emit(Done());
  }

  List<String> bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O-',
    'O+',
  ];
  List<String> chronicDiseaes = [
    ' ',
  ];
  List<String> geneticDiseaes = [' '];
  List<String> allergies = [
    ' ',
  ];

  String? bloodType;
  void changeBloodTypeValue(String bloodType) {
    this.bloodType = bloodType;
    emit(ChangeBloodTypeValueState());
    emit(Done());
  }

  String? geneticDiseaseValue;
  void changeGeneticDiseaseValue(String geneticDiseaseValue) {
    this.geneticDiseaseValue = geneticDiseaseValue;
    emit(ChangeGeneticDiseaseValueState());
    emit(Done());
  }

  String? chronicDiseaseValue;
  void changeChronicDiseaseValue(String chronicDiseaseValue) {
    this.chronicDiseaseValue = chronicDiseaseValue;
    emit(ChangeChronicDiseaseValueState());
    emit(Done());
  }

  String? allergyValue;
  void changeAllergyValue(String allergyValue) {
    this.allergyValue = allergyValue;
    emit(ChangeAllergyValueState());
    emit(Done());
  }

  General medicalDetails = const GeneralModel(
    data: '',
    message: '',
    status: false,
  );
  List<Allergy> allergy = [];
  List<Disease> chronicDisease = [];
  List<Disease> geneticDisease = [];
  List<Disease> skinDisease = [];
  //////////////////////////

/////////////////////
  Failure serverFailure = const ServerFailure(
    message: 'message',
  );
  ////////////////////
  ///
  String isMedicine = AppStrings.no;
  existMedicineOrNot(String isMedicine) {
    this.isMedicine = isMedicine;
    emit(IsMedicineState());
    emit(Done());
  }

  String isGeneticDisease = AppStrings.no;
  existGeneticDiseaseOrNot(String isGeneticDisease) {
    this.isGeneticDisease = isGeneticDisease;
    emit(IsGeneticDiseaseState());
    emit(Done());
  }

  ///medical details
  Future storeMedicalDetails(StoreMedicalDetailsParameters parameters) async {
    emit(StoreMedicalDetailsLoadingState());
    final result = await storeMedicalDetailsUseCase(parameters);

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error store medical test $l');
        emit(
          StoreMedicalDetailsErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        medicalDetails = r;
        emit(StoreMedicalDetailsSuccessState());
      },
    );
  }
  ////////////////////////////////////////

  Future getAllAllergy() async {
    emit(GellAllAllergiesLoadingState());
    /* MedicalRemoteDataSource().logOut();
    CashHelper.deleteData(key: 'token'); */
    final result = await getAllAllergiesUseCase(const NoParameters());

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error allergy ${l.message.toString()}');
        emit(
          GellAllAllergiesErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        allergy = r;
        allergies.remove(allergies[0]);
        allergy.forEach((element) {
          allergies.add(element.allergy);
        });
        debugPrint('allergy $allergies');

        emit(GellAllAllergiesSuccessState());
      },
    );
  }

  ////////////////////////////
  Future getChronicDiseases() async {
    emit(GetAllChronicLoadingState());
    final result = await getAllChronicDiseasesUseCase(const NoParameters());

    result.fold(
      (l) {
        serverFailure = l;
        emit(
          GetAllChronicErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        chronicDisease = r;
        chronicDiseaes.remove(chronicDiseaes[0]);
        chronicDisease.forEach((element) {
          chronicDiseaes.add(element.disease);
        });
        debugPrint('chronic $chronicDiseaes');

        emit(GetAllChronicSuccessState());
      },
    );
  }

  ///////////////////////////////////////
  Future getSkinDiseases() async {
    emit(GetAllSkinDiseasesLoadingState());
    final result = await getAllSkinDiseasesUseCase(const NoParameters());

    result.fold(
      (l) {
        serverFailure = l;
        emit(
          GetAllSkinDiseasesErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        skinDisease = r;
        emit(GetAllSkinDiseasesSuccessState());
      },
    );
  }

  Future getGeneticDiseases() async {
    emit(GetAllGeneticDiseasesLoadingState());
    final result = await getAllGeneticUseCase(const NoParameters());

    result.fold(
      (l) {
        serverFailure = l;
        emit(
          GetAllGeneticDiseasesErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) async {
        geneticDisease = r;
        geneticDiseaes.remove(geneticDiseaes[0]);
        geneticDisease.forEach((element) {
          geneticDiseaes.add(element.disease);
        });

        debugPrint('gentic $geneticDiseaes');
        emit(GetAllGeneticDiseasesSuccessState());
      },
    );
  }
}
