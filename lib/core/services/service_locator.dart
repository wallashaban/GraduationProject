


import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/medication_reminder_module/presentation_layer/controllers/medication_reminder_cubit.dart';

import '../../medication_reminder_module/data_layer/repository/medication_reminder_repository.dart';

final sl = GetIt.instance;


class ServiceLocator {
  void init(){
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
      () => AuthenticationCubit(sl(),sl(),sl(),sl(),sl(),sl(),sl(),),
    );
    //////////////////////////////////
    ///medical  details
     
      /// medical remoteDataSource
    sl.registerLazySingleton<BaseMedicalRemoteDataSource >(
      () => MedicalRemoteDataSource(),
    );

    /// medical Repository
    sl.registerLazySingleton<BaseMedicalDetailsRepository>(
      () => MedicalRepository(sl()),
    );
    /////////////////////////////////
     ///medical  details
     
      /// medical remoteDataSource
    sl.registerLazySingleton<BasePrescriptionRemotDataSource >(
      () => PrescriptionRemoteDataSource(),
    );

    /// medical Repository
    sl.registerLazySingleton<BasePrescriptionRepository>(
      () => PrescriptionRepository(sl()),
    );

    /////////////////////////////////
    ///medical  details
     
      /// medical remoteDataSource
    sl.registerLazySingleton<BaseMedicalTestsRemoteDataSource >(
      () => MedicalTestsRemoteDataSource(),
    );

    /// medical Repository
    sl.registerLazySingleton<BaseMedicalTestsRepository>(
      () => MedicalTestsRepository(sl()),
    );
    /////////////////////////////////
   
    ///medical  details
     
      /// medical remoteDataSource
    sl.registerLazySingleton<BaseTeethDevelopmentRemoteDataSource >(
      () => TeethDevelopmentRemoteDataSource(),
    );

    /// medical Repository
    sl.registerLazySingleton<BaseTeetDevelopmentRepository>(
      () => TeethDevelopmentRepository(sl()),
    );

     ///medical  details
     
      /// medical remoteDataSource
    sl.registerLazySingleton<BaseMedicationReminderRemoteDataSource >(
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

     /// medical cubit
    sl.registerFactory(
      () => MedicalCubit(sl(),sl(),sl(),sl(),sl(),),
    );

    /// precription cubit
    sl.registerFactory(
      () => PrescriptionCubit(sl(),sl(),sl(),sl(),sl(),),
    );

    /// teeth cubit
    sl.registerFactory(
      () => TeethDevelopmentCubit(sl(),sl(),sl(),sl(),sl(),),
    );

    /// medical test cubit
    sl.registerFactory(
      () => MedicalTestsCubit(sl(),sl(),sl(),sl(),sl(),),
    );

  /// medical test cubit
    sl.registerFactory(
      () => MedicationReminderCubit(sl(),sl(),sl(),sl(),sl(),sl(),),
    );


  }
}
