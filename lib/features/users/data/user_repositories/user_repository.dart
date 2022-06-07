import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_structure_learning/commons/app_error.dart';
import 'package:new_structure_learning/features/users/data/data_sources/user_data_sources.dart';
import 'package:new_structure_learning/features/users/data/models/user_model.dart';

abstract class UserRepository {
  Future<Either<AppError, List<UserModel>>> getUser();
}

class UserRepositoryImpl extends UserRepository {
  final UserDataSources _userDataSources;
  UserRepositoryImpl(this._userDataSources);
  @override
  Future<Either<AppError, List<UserModel>>> getUser() async {
    try {
      final result = await _userDataSources.getUsers();
      return Right(result);
    } on DioError catch (e) {
      return Left(
        AppError(message: e.message),
      );
    }
  }
}

final userRepositoryProvider = Provider<UserRepositoryImpl>((ref) {
  return UserRepositoryImpl(ref.watch(userDataSourceProvider));
});
