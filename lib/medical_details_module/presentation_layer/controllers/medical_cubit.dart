// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/development_flow_module/presentation_layer/controllers/development_flow_state.dart';
import 'package:graduation_project/medical_details_module/domain_layer/use_cases/show_details_use_case.dart';
import 'package:graduation_project/settings_notifications_module/presentation_layer/screens/notifications_screen.dart';

import '../../../core/caching_data/medical_details_cach.dart';
import '../../../report_module/presentation_layer/screens/reports_screen.dart';
import '../../../settings_notifications_module/presentation_layer/screens/settings_screen.dart';
import '../../domain_layer/entites/medical_details.dart';
import '../../domain_layer/use_cases/update_details_use_case.dart';

part 'medical_state.dart';

class MedicalCubit extends Cubit<MedicalState> {
  //medical details
  final StoreMedicalDetailsUseCase storeMedicalDetailsUseCase;
  final UpdateMedicalDetailsUseCase updateMedicalDetailsUseCase;
  final ShowMedicalDetailsUseCase showMedicalDetailsUseCase;
  /////////////////////////////////

  ///////////////////////////

  MedicalCubit(
    this.storeMedicalDetailsUseCase,
    this.updateMedicalDetailsUseCase,
    this.showMedicalDetailsUseCase,
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
    'AB+',
    'AB-',
  ];
  List<String> chronicDiseaes = [
    ' ',
    'لتهاب الجلد التأتبي (الإكزيما)',
    'الوحمات، الأورام الوعائية',
    'سرطانات الجلد',
    'الورم الميلانيني',
    'أمراض النسيج الضام للجلد',
    'التهاب الجلد التماسي',
    'جُلادات الحمل',
    'احمرار الأطراف',
    'تساقط الشعر',
    'التهابات في الجلد',
    'الاضطرابات الوراثية',
    'الشامات',
    'الصدفية',
    'التشوهات الوعائية',
    'الثآليل',
    'الحمامى السميه',
    'الإكزيما',
    'الحصف',
    'الجدري',
    'الحمى القرمزية',
    'القوباء الحلقية',
    'الشرى (الأرتكاريا)',
    'التهاب السحايا'
  ];
  List<String> geneticDiseaes = [
    ' ',
    'متلازمة داون',
    'تأخر التطور والنمو الذهني',
    'التوحد',
    'خلل في التنسج الهيكلي وفشل النمو',
    'الاضطرابات الاستقلابية',
    'اضطرابات الميتوكوندريا',
    'السرطانات الوراثية العائلية',
    'ضعف السمع الوراثي',
    'التليف الكيسي',
    'أمراض العيون',
    'مرض هنتنجتون',
    'الثلاسيميا',
    'مرض تاي ساكس',
    'متلازمة نونان',
    'الخصية المعلقة'
  ];
  List<String> allergies = [
    ' ',
    'حساسية البيض',
    'حساسية الحليب',
    'حساسية الفول السوداني',
    'القمح',
    'الأسماك',
    'المحار',
    'الجوز',
    'الصويا',
    'حساسية الغبار',
    'حساسية  حشرية',
    'الربو الحساسي',
    'التهاب الأنف الحساسي (حمى القش)',
    'التهاب الملتحمة الحساسي (حالات حساسية العين)',
    'حالات حساسية الطعام',
    'لأرتيكاريا الحادة والمزمنة',
    'التهاب الجلد التأتبي والتماسي (الإكزيمة)',
    'الوذمة الوعائية الوراثية (التورم تحت الجلد)',
    'ضطرابات الخلايا اليوزينية',
    'التهاب الأمعاء والقولون الناجم عن بروتين الطعام (EPIES)'
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

  MedicalDetails? medicalDetails;
  MedicalDetails? medicalDetailsUpdate;

  //////////////////////////

/////////////////////
  Failure serverFailure = const ServerFailure(
    message: 'message',
  );
  ////////////////////
  ///
  bool? isMedicine;
  existMedicineOrNot(bool isMedicine) {
    this.isMedicine = isMedicine;
    emit(IsMedicineState());
    emit(Done());
  }

  bool? isGeneticDisease;
  existGeneticDiseaseOrNot(bool isGeneticDisease) {
    this.isGeneticDisease = isGeneticDisease;
    emit(IsGeneticDiseaseState());
    emit(Done());
  }

  var medical =
      Hive.box('userDataCach').get('medicalDetails${userDataCach.id}');

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
        // medical = Hive.box('userDataCach').get('medicalDetails${r.userId}');
        Hive.box('userDataCach').put(
            'medicalDetails${r.userId}',
            MedicalDetailsCach(
              id: r.id,
              userId: r.userId,
              bloodType: r.bloodType,
              allergy: r.allergy,
              genticDisease: r.genticDisease,
              skinDisease: r.skinDisease,
              chronicDisease: r.chronicDisease,
              isMedicine:
                  isMedicine ?? medical == null ? null : medical.isMedicine,
              medicineFile: (isMedicine == true ||
                      (medical != null && medical.isMedicine == true))
                  ? r.isMedicine
                  : null,
              isGenticDisease: r.genticDisease == null ? false : true,
            ));
        medical =
            Hive.box('userDataCach').get('medicalDetails${userDataCach.id}');
        CashHelper.saveData(
          key: 'medicalDetailsRecorded',
          value: true,
        );
      },
    );
  }

  ////////////////////////////////////////

  Future updateMedicalDetails(StoreMedicalDetailsParameters parameters) async {
    emit(UpdateMedicalDetailsLoadingState());
    final result = await updateMedicalDetailsUseCase(parameters);

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error update medical test cubit $l');
        emit(
          UpdateMedicalDetailsErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        medicalDetailsUpdate = r;
        emit(UpdateMedicalDetailsSuccessState());
        // medical = Hive.box('userDataCach').get('medicalDetails${r.userId}');
        debugPrint('statement cubit ${r.userId}');
        Hive.box('userDataCach').put(
            'medicalDetails${r.userId}',
            MedicalDetailsCach(
              id: r.id,
              userId: userDataCach.id,
              bloodType: r.bloodType,
              allergy: r.allergy,
              genticDisease: r.genticDisease,
              skinDisease: r.skinDisease,
              chronicDisease: r.chronicDisease,
              isMedicine: medical == null
                  ? isMedicine
                  : isMedicine ?? medical.isMedicine,
              medicineFile: r.isMedicine,
              isGenticDisease: r.genticDisease == null ? false : true,
            ));
        //todo
        geneticDiseaseValue =
            chronicDiseaseValue = allergyValue = bloodType = null;
      },
    );
    medical = Hive.box('userDataCach').get('medicalDetails${userDataCach.id}');
    debugPrint(
        'data cubit ${Hive.box('userDataCach').get('medicalDetails${userDataCach.id}')}');
    emit(Done());
  }

  Future showMedicalDetails() async {
    emit(ShowMedicalDetailsLoadingState());
    final result = await showMedicalDetailsUseCase(const NoParameters());

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error store medical test $l');
        emit(
          ShowMedicalDetailsErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        medicalDetails = r;
        if (medicalDetails != null) {
          Hive.box('userDataCach').put(
              'medicalDetails${r.userId}',
              MedicalDetailsCach(
                id: r.id,
                userId: r.userId,
                bloodType: r.bloodType,
                allergy: r.allergy,
                genticDisease: r.genticDisease,
                skinDisease: r.skinDisease,
                chronicDisease: r.chronicDisease,
                isMedicine:
                    isMedicine ?? medical == null ? null : medical.isMedicine,
                medicineFile: (isMedicine == true ||
                        (medical != null && medical.isMedicine == true))
                    ? r.isMedicine
                    : null,
                isGenticDisease: r.genticDisease == null ? false : true,
              ));
          medical =
              Hive.box('userDataCach').get('medicalDetails${userDataCach.id}');
          CashHelper.saveData(
            key: 'medicalDetailsRecorded',
            value: true,
          );
        }
        emit(ShowMedicalDetailsSuccessState());
      },
    );
  }
}
