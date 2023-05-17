import 'package:graduation_project/ai_diseases_module/data_layer/data_source/disease_remote_data_source.dart';
import 'package:graduation_project/ai_diseases_module/data_layer/repository/disease_repository.dart';
import 'package:graduation_project/ai_diseases_module/domain_layer/repository/disease_base_repository.dart';
import 'package:graduation_project/ai_diseases_module/domain_layer/use_cases/delete_ai_sisease_use_case.dart';
import 'package:graduation_project/ai_diseases_module/domain_layer/use_cases/predict_disease_use_case.dart';
import 'package:graduation_project/ai_diseases_module/domain_layer/use_cases/store_ai_sisease_use_case.dart';
import 'package:graduation_project/settings_notifications_module/data_layer/data_source/settings_notifications_remote_data_source.dart';
import 'package:graduation_project/settings_notifications_module/domain_layer/use_cases/log_out_use_case.dart';
import 'package:graduation_project/settings_notifications_module/domain_layer/use_cases/make_review_use_case.dart';
import 'package:graduation_project/settings_notifications_module/presentation_layer/cotrollers/settings_notifications_cubit.dart';

import '../../ai_diseases_module/domain_layer/use_cases/get_ai_sisease_use_case.dart';
import '../../ai_diseases_module/presentation_layer/cubit/disease_cubit.dart';
import '../../development_flow_module/domain_layer/use_cases/update_tips_use_case.dart';
import '../../report_module/data_layer/data_source/report_remote_data_source.dart';
import '../../report_module/data_layer/repository/report_repository.dart';
import '../../report_module/domain_layer/base_repository/base_report_repository.dart';
import '../../report_module/domain_layer/use_case/disease_report_usecase.dart';
import '../../report_module/domain_layer/use_case/latest_development_usecase.dart';
import '../../report_module/domain_layer/use_case/latest_teeth_usecase.dart';
import '../../report_module/domain_layer/use_case/medical_info_usecase.dart';
import '../../report_module/domain_layer/use_case/vaccination_report_usecase.dart';
import '../../report_module/presentation_layer/controllers/report_cubit.dart';
import '../../settings_notifications_module/data_layer/repository/settings_notifications_repository.dart';
import '../../settings_notifications_module/domain_layer/repository/settings_notifications_base_repo.dart';
import '../../settings_notifications_module/domain_layer/use_cases/get_history_notifications_use_case.dart';
import '../../settings_notifications_module/domain_layer/use_cases/update_user_info_use_case.dart';
import '../../vaccinations_module/data_layer/data_source/vaccination_remote_data_source.dart';
import '../../vaccinations_module/data_layer/reposirtory/vaccination_repository.dart';
import '../../vaccinations_module/domain_layer/repository/base_vaccination_repo.dart';
import '../../vaccinations_module/domain_layer/use_cases/attatch_vaccination_use_case.dart';
import '../../vaccinations_module/domain_layer/use_cases/get_all_vaccination_use_case.dart';
import '../../vaccinations_module/domain_layer/use_cases/get_single_vaccination_use_case.dart';
import '../../vaccinations_module/domain_layer/use_cases/stop_or_active_vaccination_use_case.dart';
import '../../vaccinations_module/presentaion_layer/controllers/vaccinations_cubit.dart';
import '../utils/exports.dart';
import '../../medication_reminder_module/presentation_layer/controllers/medication_reminder_cubit.dart';

import '../../medication_reminder_module/data_layer/repository/medication_reminder_repository.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /////////////////////////////////
    ///auth
    /// Authentication remoteDataSource
    sl.registerLazySingleton<BaseAuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSource(),
    );

    /// Authentication Repository
    sl.registerLazySingleton<BaseAuthenticationRepository>(
      () => AuthenticationRepository(sl()),
    );

    /// Authentication register UseCase
    sl.registerLazySingleton(
      () => RegisterUserUseCase(sl()),
    );

    /// Authentication signIn UseCase
    sl.registerLazySingleton(
      () => LoginUserUseCase(sl()),
    );

    /// Authentication login with google UseCase
    sl.registerLazySingleton(
      () => LoginWithGoogleUseCase(sl()),
    );

    /// Authentication LoginWith facebook UseCase
    sl.registerLazySingleton(
      () => LoginWithFacebookUseCase(sl()),
    );

    /// Authentication Forget password UseCase
    sl.registerLazySingleton(
      () => ForgetPasswordUseCase(sl()),
    );

    /// Authentication update password UseCase
    sl.registerLazySingleton(
      () => UpdatePasswordUseCase(sl()),
    );

    /// Authentication update password UseCase
    sl.registerLazySingleton(
      () => CheckCodeUseCase(sl()),
    );

    /// Authentication cubit
    sl.registerFactory(
      () => AuthenticationCubit(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
    //////////////////////////////////
    ///medical  details

    /// medical remoteDataSource
    sl.registerLazySingleton<BaseMedicalRemoteDataSource>(
      () => MedicalRemoteDataSource(),
    );

    /// medical Repository
    sl.registerLazySingleton<BaseMedicalDetailsRepository>(
      () => MedicalRepository(sl()),
    );
    /////////////////////////////////
    ///medical  details

    /// medical remoteDataSource
    sl.registerLazySingleton<BasePrescriptionRemotDataSource>(
      () => PrescriptionRemoteDataSource(),
    );

    /// medical Repository
    sl.registerLazySingleton<BasePrescriptionRepository>(
      () => PrescriptionRepository(sl()),
    );

    /////////////////////////////////
    ///medical  details

    /// medical remoteDataSource
    sl.registerLazySingleton<BaseMedicalTestsRemoteDataSource>(
      () => MedicalTestsRemoteDataSource(),
    );

    /// medical Repository
    sl.registerLazySingleton<BaseMedicalTestsRepository>(
      () => MedicalTestsRepository(sl()),
    );
    /////////////////////////////////

    ///medical  details

    /// medical remoteDataSource
    sl.registerLazySingleton<BaseTeethDevelopmentRemoteDataSource>(
      () => TeethDevelopmentRemoteDataSource(),
    );

    /// medical Repository
    sl.registerLazySingleton<BaseTeetDevelopmentRepository>(
      () => TeethDevelopmentRepository(sl()),
    );

    ///medical  details

    /// medical remoteDataSource
    sl.registerLazySingleton<BaseMedicationReminderRemoteDataSource>(
      () => MedicationReminderRemoteDataSource(),
    );

    /// medical Repository
    sl.registerLazySingleton<BaseMedicationReminderRepository>(
      () => MedicationRepository(sl()),
    );
    /////////////////////////////////

    ///medical details

    /// medical details use case
    sl.registerLazySingleton(
      () => StoreMedicalDetailsUseCase(sl()),
    );

    /// get all allergies details
    sl.registerLazySingleton(
      () => GetAllAllergiesUseCase(sl()),
    );

    /// get all skin diseases use case
    sl.registerLazySingleton(
      () => GetAllSkinDiseasesUseCase(sl()),
    );

    /// medical genetic
    sl.registerLazySingleton(
      () => GetAllGeneticUseCase(sl()),
    );

    /// medical chronic
    sl.registerLazySingleton(
      () => GetAllChronicDiseasesUseCase(sl()),
    );
//////////////////////////////////
    ///medical tests
    /// store medical tests
    sl.registerLazySingleton(
      () => StoreMedicalTestsUseCase(sl()),
    );

    ///get medical tests
    sl.registerLazySingleton(
      () => GetAllAllMedicalTestUseCase(sl()),
    );

    ///get single medical test
    sl.registerLazySingleton(
      () => GetSingleMedicalTestUseCase(sl()),
    );

    ///update  medical test
    sl.registerLazySingleton(
      () => UpdateMedicalTestUseCase(sl()),
    );

    ///delete medical test
    sl.registerLazySingleton(
      () => DeleteMedicalTestUseCase(sl()),
    );
    ////////////////////////////////
    ///prescription
    /// store prescriptin
    sl.registerLazySingleton(
      () => StorePrescriptionUseCase(sl()),
    );

    /// delete pres
    sl.registerLazySingleton(
      () => DeletePrescriptionUseCase(sl()),
    );

    /// get all pres
    sl.registerLazySingleton(
      () => GetAllPrescriptionsUseCase(sl()),
    );

    /// get single pres
    sl.registerLazySingleton(
      () => GetSinglePrescriptionUseCase(sl()),
    );

    /// update press
    sl.registerLazySingleton(
      () => UpdatePrescriptionUseCase(sl()),
    );

    //////////////////////////////
    ///teeth development

    /// store teeth
    sl.registerLazySingleton(
      () => StoreTeethDevelopmentUseCase(sl()),
    );

    /// get all teeeth
    sl.registerLazySingleton(
      () => GetTeethUseCase(sl()),
    );

    /// get single teeth
    sl.registerLazySingleton(
      () => GetSingleToothUseCase(sl()),
    );

    /// update tooth
    sl.registerLazySingleton(
      () => UpdateTeethDevelopmentUseCase(sl()),
    );

    /// delete tooth
    sl.registerLazySingleton(
      () => DeleteTeethUseCase(sl()),
    );

    /// /// store teeth
    sl.registerLazySingleton(
      () => StoreReminderUseCase(sl()),
    );

    /// get all teeeth
    sl.registerLazySingleton(
      () => GetAllMedicationReminderUseCase(sl()),
    );

    /// get single teeth
    sl.registerLazySingleton(
      () => GetSingleRminderUseCase(sl()),
    );

    /// update tooth
    sl.registerLazySingleton(
      () => UpdateReminderUseCase(sl()),
    );

    /// delete tooth
    sl.registerLazySingleton(
      () => DeleteReminderUseCase(sl()),
    );

    /// delete tooth
    sl.registerLazySingleton(
      () => GetAllDaysUseCase(sl()),
    );

    ///auth
    /// SettingsNotifications remoteDataSource
    sl.registerLazySingleton<BaseSettingsNotificationsRemotDataSource>(
      () => SettingsNotificationsRemoteDataSource(),
    );

    /// SettingsNotifications Repository
    sl.registerLazySingleton<SettingsNotificationsBaseRepository>(
      () => SettingsNotificationsRepository(sl()),
    );

    /// SettingsNotifications update UseCase
    sl.registerLazySingleton(
      () => UpdateUserInfoUseCase(sl()),
    );
    sl.registerLazySingleton(
      () => LogOutUseCase(sl()),
    );

    /// Authentication signIn UseCase
    sl.registerLazySingleton(
      () => MakeReviewUseCase(sl()),
    );

       /// Authentication signIn UseCase
    sl.registerLazySingleton(
      () => GetHistoryNotificationsUseCase(sl()),
    );

    /// medical cubit
    sl.registerFactory(
      () => MedicalCubit(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );

    /// precription cubit
    sl.registerFactory(
      () => PrescriptionCubit(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );

    /// teeth cubit
    sl.registerFactory(
      () => TeethDevelopmentCubit(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );

    /// medical test cubit
    sl.registerFactory(
      () => MedicalTestsCubit(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );

    /// medical test cubit
    sl.registerFactory(
      () => MedicationReminderCubit(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );

    /// SettingsNotifications test cubit
    sl.registerFactory(
      () => SettingsNotificationsCubit(
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
    
    //
    //vaccination
    sl.registerLazySingleton<BaseVaccinationRemoteDataSource>(
      () => VaccinationRemoteDataSource(),
    );

    sl.registerLazySingleton<BaseVaccinationRepository>(
      () => VaccinationRepository(sl()),
    );

    sl.registerLazySingleton(
      () => GetAllVaccinationUseCase(sl()),
    );
    sl.registerLazySingleton(
      () => GetSingleVaccinationUseCase(sl()),
    );
    sl.registerLazySingleton(
      () => AttachVaccinationUseCase(sl()),
    );
    sl.registerLazySingleton(
      () => StopOrActiveVaccinationUseCase(sl()),
    );
    sl.registerFactory(
      () => VaccinationsCubit(sl(),sl(),sl(),sl()),
    );

         //report
    sl.registerLazySingleton<BaseReportRemoteDataSource>(
      () => ReportRemoteDataSource(),
    );

    sl.registerLazySingleton<BaseReportRepository>(
      () => ReportRepository(sl()),
    );

    sl.registerLazySingleton(
      () => DiseaseReportUseCase(sl()),
    );
    sl.registerLazySingleton(
      () => LatestDevelopmentUseCase(sl()),
    );
    sl.registerLazySingleton(
      () => LatestTeethUseCase(sl()),
    );
    sl.registerLazySingleton(
      () => MedicalInfoUseCase(sl()),
    );
    sl.registerLazySingleton(
      () => VaccinationReportUseCase(sl()),
    );
    sl.registerFactory(
      () => ReportCubit(sl(),sl(),sl(),sl(),sl()),
    );

    //aiDisease
     
     sl.registerLazySingleton<BaseDiseaseRemoteDataSource>(
       () => DiseaseRemoteDataSource(),
     );

     sl.registerLazySingleton<DiseaseBaseRepository>(
       () => DiseaseRepository(sl(),),
     );
     sl.registerLazySingleton(
      () => StoreAiDiseaseUseCase(sl()),
     );

     sl.registerLazySingleton(
       () => DeleteAiDiseaseUseCase(sl()),
     );
     sl.registerLazySingleton(
       () => PredictDiseaseUseCase(sl()),
     );
     sl.registerLazySingleton(
       () => GetAiDiseaseUseCase(sl()),
     );
     sl.registerFactory(
      () => DiseaseCubit(sl(),sl(),sl(),sl(),),
    );
        //development flow
    // sl.registerLazySingleton<BaseDevelopmentFlowRemoteDataSource>(
    //   () => DevelopmentFlowRemoteDataSource(),
    // );

    // sl.registerLazySingleton<BaseDevelopmentFlowRepository>(
    //   () => DevelopmentFlowRepository(sl()),
    // );

    // sl.registerLazySingleton(
    //   () => AllTipsUseCase(sl()),
    // );
    // sl.registerLazySingleton(
    //   () => QuestionsOfTipUseCase(sl()),
    // );
    // sl.registerLazySingleton(
    //   () => SubjectsWithQuestionsUseCase(sl()),
    // );
    sl.registerLazySingleton(
      () => UpdateTipsUseCase(sl()),
    );
  /*   sl.registerLazySingleton(
      () => CreateTipsUseCase(sl()),
    );
    sl.registerFactory(
      () => DevelopmentFlowCubit(sl(),sl(),sl(),sl(),sl()),
    ); */
  }
}
