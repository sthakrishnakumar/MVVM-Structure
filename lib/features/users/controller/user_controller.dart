import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_structure_learning/features/users/data/models/user_model.dart';
import 'package:new_structure_learning/features/users/data/user_repositories/user_repository.dart';

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

class UserDataNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
  UserDataNotifier() : super(const AsyncValue.loading());
}
