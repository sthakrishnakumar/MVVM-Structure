import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_structure_learning/commons/config.dart';
import 'package:new_structure_learning/core/api_client.dart';
import 'package:new_structure_learning/features/users/data/models/user_model.dart';

abstract class UserDetailDataSource {
  Future<UserDetailModel> getUserDetail(int id);
}

class UserDetailDataSourceImpl extends UserDetailDataSource {
  final ApiClient _apiClient;
  UserDetailDataSourceImpl(this._apiClient);
  @override
  Future<UserDetailModel> getUserDetail(int id) async {
    final result = await _apiClient.request(path: "${Config.endpoint}/$id");
    return UserDetailModel.fromJson(result);
  }
}

final userDetailDataProvider = Provider<UserDetailDataSource>((ref) {
  return UserDetailDataSourceImpl(ref.watch(apiClientProvider));
});
