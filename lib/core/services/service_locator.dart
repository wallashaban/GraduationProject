import 'package:get_it/get_it.dart';
import 'package:graduation_project/authentication_module/data_layer/data_sourde/auth_remote_data_source.dart';
import 'package:graduation_project/authentication_module/data_layer/repository/auth_repository.dart';
import 'package:graduation_project/authentication_module/domain_layer/repository/base_auth_reposutory.dart';
import 'package:graduation_project/authentication_module/domain_layer/use_cases/forget_password_use_case.dart';
import 'package:graduation_project/authentication_module/domain_layer/use_cases/login_user_use_case.dart';
import 'package:graduation_project/authentication_module/domain_layer/use_cases/login_with_facebook_use_case.dart';
import 'package:graduation_project/authentication_module/domain_layer/use_cases/login_with_google_use_case.dart';
import 'package:graduation_project/authentication_module/domain_layer/use_cases/register_user_use_case.dart';
import 'package:graduation_project/authentication_module/domain_layer/use_cases/update_password_use_case.dart';
import 'package:graduation_project/authentication_module/presentaion_layer/controllers/authentication_cubit.dart';

final sl = GetIt.instance;


class ServiceLocator {
  void init(){
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

     /// Authentication cubit
    sl.registerFactory(
      () => AuthenticationCubit(sl(),sl(),sl(),sl(),sl(),sl(),),
    );

  }
}
