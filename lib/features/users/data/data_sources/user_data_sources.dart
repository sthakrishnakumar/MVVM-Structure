import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_structure_learning/commons/config.dart';
import 'package:new_structure_learning/core/api_client.dart';
import 'package:new_structure_learning/features/users/data/models/user_model.dart';

final userDataSourceProvider = Provider<UserDataSourcesImpl>((ref) {
  return UserDataSourcesImpl(ref.watch(apiClientProvider));
});

abstract class UserDataSources {
  Future<List<UserModel>> getUsers();
}

class UserDataSourcesImpl extends UserDataSources {
  final ApiClient _apiClient;
  UserDataSourcesImpl(this._apiClient);

  @override
  Future<List<UserModel>> getUsers() async {
    var result = await _apiClient.request(path: Config.endpoint);
    List data = result['data'];
    return data.map((e) => UserModel.fromJson(e)).toList();
  }
}
