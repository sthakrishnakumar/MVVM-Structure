import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_structure_learning/commons/app_error.dart';
import 'package:new_structure_learning/features/users/data/models/user_model.dart';
import 'package:new_structure_learning/features/users/data/user_repositories/user_repository.dart';

final getUserProvider =
    FutureProvider<Either<AppError, List<UserModel>>>((ref) async {
  return ref.watch(userRepositoryProvider).getUser();
});
