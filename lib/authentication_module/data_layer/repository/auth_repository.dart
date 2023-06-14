import 'package:dartz/dartz.dart';
import '../../../core/utils/exports.dart';


class AuthenticationRepository implements BaseAuthenticationRepository {
  final BaseAuthenticationRemoteDataSource baseAuthenticationRemoteDataSource;

  AuthenticationRepository(this.baseAuthenticationRemoteDataSource);
  @override
  Future<Either<Failure, Authentication>> loginUser(
      LoginUserParameters parameters) async {
    
    try {
      final result = await baseAuthenticationRemoteDataSource.loginUser(
      parameters,
    );
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
    
     try {
      final result= await baseAuthenticationRemoteDataSource.registerUser(
      parameters,
    );
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
    
     try {
      final result= await baseAuthenticationRemoteDataSource.checkCode(
      code,
    );
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
   
     try {
       final result= await baseAuthenticationRemoteDataSource.forgetPassword(
      email,
    );
    debugPrint('result');
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
     try {
      final result= await baseAuthenticationRemoteDataSource.loginWithFacebook(
      parameters,
    );
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
    
     try {
      final result= await baseAuthenticationRemoteDataSource.loginWithGoogle(
      parameters,
    );
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
    
     try {
      final result= await baseAuthenticationRemoteDataSource.updatePassword(
      parameters,
    );
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
  Future<Either<Failure, Authentication>> updateUserInfo(
      RegisterUserParameters parameters) async {
    
    try {
      final result = await baseAuthenticationRemoteDataSource.updateUserInfo(
      parameters,
    );
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
