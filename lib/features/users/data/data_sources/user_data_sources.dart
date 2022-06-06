import 'package:new_structure_learning/commons/config.dart';
import 'package:new_structure_learning/core/api_client.dart';
import 'package:new_structure_learning/features/users/data/models/user_model.dart';

abstract class UserDataSources {
  Future<List<UserModel>> getUsers();
}

class UserDataSourcesImpl extends UserDataSources {
  @override
  Future<List<UserModel>> getUsers() async {
    var result = await ApiClient().request(path: Config.endpoint);
    List data = result['data'];
    return data.map((e) => UserModel.fromJson(e)).toList();
  }
}
