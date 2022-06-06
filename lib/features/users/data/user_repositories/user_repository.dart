import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:new_structure_learning/commons/app_error.dart';
import 'package:new_structure_learning/features/users/data/data_sources/user_data_sources.dart';
import 'package:new_structure_learning/features/users/data/models/user_model.dart';

abstract class UserRepository {
  Future<Either<AppError, List<UserModel>>> getUser();
}

class UserRepositoryImpl extends UserRepository {
  @override
  Future<Either<AppError, List<UserModel>>> getUser() async {
    try {
      final result = await UserDataSourcesImpl().getUsers();
      return Right(result);
    } on DioError catch (e) {
      return Left(
        AppError(message: e.message),
      );
    }
  }
}
