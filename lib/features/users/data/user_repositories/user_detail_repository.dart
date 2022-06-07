import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_structure_learning/commons/app_error.dart';
import 'package:new_structure_learning/features/users/data/data_sources/user_detail_data_source.dart';
import 'package:new_structure_learning/features/users/data/models/user_model.dart';

abstract class UserDetailRepository {
  Future<Either<AppError, UserDetailModel>> getUserDetail(int id);
}

class UserDetailRepositoryImpl extends UserDetailRepository {
  final UserDetailDataSource _userDetailDataSource;
  UserDetailRepositoryImpl(this._userDetailDataSource);
  @override
  Future<Either<AppError, UserDetailModel>> getUserDetail(int id) async {
    try {
      final result = await _userDetailDataSource.getUserDetail(id);
      return Right(result);
    } on DioError catch (e) {
      return Left(
        AppError(message: e.message),
      );
    }
  }
}

final userDetailsRepoProvider = Provider<UserDetailRepository>((ref) {
  return UserDetailRepositoryImpl(ref.watch(userDetailDataProvider));
});
