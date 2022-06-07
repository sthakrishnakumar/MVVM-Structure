// class UserNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
//   UserNotifier(this._userRepository) : super(const AsyncValue.loading()) {
//     fetch();
//   }
//   final UserRepository _userRepository;
//   fetch() async {
//     final data = await _userRepository.getUser();
//     data.fold((l) => state = AsyncValue.error(l.message),
//         (r) => state = AsyncValue.data(r));
//   }
// }

// final userNotifierProvider =
//     StateNotifierProvider<UserNotifier, AsyncValue<List<UserModel>>>((ref) {
//   return UserNotifier(ref.watch(userRepositoryProvider));
// });

// class UserDataNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
//   UserDataNotifier(this._userRepository) : super(const AsyncValue.loading()) {
//     fetchData();
//   }
//   final UserRepository _userRepository;
//   Future fetchData() async {
//     final data = await _userRepository.getUser();
//     data.fold((l) => state = AsyncValue.error(l.message),
//         (r) => state = AsyncValue.data(r));
//   }
// }

// final userNotifierProvider =
//     StateNotifierProvider<UserDataNotifier, AsyncValue<List<UserModel>>>((ref) {
//   return UserDataNotifier(ref.watch(userRepositoryProvider));
// });

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_structure_learning/features/users/data/models/user_model.dart';
import 'package:new_structure_learning/features/users/data/user_repositories/user_repository.dart';

class UserDataNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
  UserDataNotifier(this._userRepository) : super(const AsyncValue.loading()) {
    getData();
  }
  final UserRepository _userRepository;
  Future getData() async {
    final data = await _userRepository.getUser();
    return data.fold((l) => state = AsyncValue.error(l.message),
        (r) => state = AsyncValue.data(r));
  }
}

final userDataNotifierProvider =
    StateNotifierProvider<UserDataNotifier, AsyncValue<List<UserModel>>>((ref) {
  return UserDataNotifier(ref.watch(userRepositoryProvider));
});
