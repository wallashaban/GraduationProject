import 'package:dartz/dartz.dart';
import 'package:graduation_project/authentication_module/data_layer/data_sourde/auth_remote_data_source.dart';
import 'package:graduation_project/authentication_module/domain_layer/entities/authentication.dart';
import 'package:graduation_project/authentication_module/domain_layer/repository/base_auth_reposutory.dart';
import 'package:graduation_project/core/error/exception.dart';
import 'package:graduation_project/core/use_case/base_use_case.dart';

import '../../../core/error/failure.dart';

class AuthenticationRepository implements BaseAuthenticationRepository {
  final BaseAuthenticationRemoteDataSource baseAuthenticationRemoteDataSource;

  AuthenticationRepository(this.baseAuthenticationRemoteDataSource);
  @override
  Future<Either<Failure, Authentication>> loginUser(
      LoginUserParameters parameters) async {
    final result = await baseAuthenticationRemoteDataSource.loginUser(
      parameters,
    );
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure,Authentication>> registerUser(RegisterUserParameters parameters) async {
    final result= await baseAuthenticationRemoteDataSource.registerUser(
      parameters,
    );
     try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure,void>> checkCode(String code) async {
    final result= await baseAuthenticationRemoteDataSource.checkCode(
      code,
    );
     try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure,void>> forgetPassword(String email) async {
    final result= await baseAuthenticationRemoteDataSource.forgetPassword(
      email,
    );
     try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure,Authentication>> loginWithFacebook(
      LoginWithFacebookOrGoogleParameters parameters) async {
    final result= await baseAuthenticationRemoteDataSource.loginWithFacebook(
      parameters,
    );
     try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure,Authentication>> loginWithGoogle(
      LoginWithFacebookOrGoogleParameters parameters) async {
    final result= await baseAuthenticationRemoteDataSource.loginWithGoogle(
      parameters,
    );
     try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure,void>> updatePassword(UpdatePasswordParameters parameters) async {
    final result= await baseAuthenticationRemoteDataSource.updatePassword(
      parameters,
    );
     try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
        message: failure.errorMessageModel.message,
        ),
      );
    }
  }
}
