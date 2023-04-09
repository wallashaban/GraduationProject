

import 'package:graduation_project/core/utils/exports.dart';


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
    const NotificationScreen(),
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
  String? bloodType;
  void changeBloodTypeValue(String bloodType) {
    this.bloodType = bloodType;
    emit(ChangeBloodTypeValueState());
    emit(Done());
  }
  String? geneticDiseaseValue = '';
  void changeGeneticDiseaseValue(String geneticDiseaseValue) {
    this.geneticDiseaseValue = geneticDiseaseValue;
    emit(ChangeGeneticDiseaseValueState());
    emit(Done());
  }

   String? chronicDiseaseValue = '';
  void changeChronicDiseaseValue(String chronicDiseaseValue) {
    this.chronicDiseaseValue = chronicDiseaseValue;
    emit(ChangeChronicDiseaseValueState());
    emit(Done());
  }

   String? allergyValue = '';
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
  ///medical details
  Future storeMedicalDetails(StoreMedicalDetailsParameters parameters) async {
    emit(StoreMedicalDetailsLoadingState());
    final result = await storeMedicalDetailsUseCase(parameters);

    result.fold(
      (l) {
        serverFailure = l;
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
      (r) {
        geneticDisease = r;
        emit(GetAllGeneticDiseasesSuccessState());
      },
    );
  } 
   
}
