import 'package:dio/dio.dart';
import 'package:new_structure_learning/commons/config.dart';
import 'package:new_structure_learning/features/users/data/models/user_model.dart';

class ApiClient {
  Future<List<UserModel>> getUsers() async {
    final result = await Dio(
      BaseOptions(baseUrl: Config.baseUrl),
    ).get(Config.endpoint);
    List data = result.data;
    return data.map((e) => UserModel.fromJson(e)).toList();
  }

  Future request({
    required String path,
    String type = 'get',
    Map<String, dynamic>? data,
  }) async {
    Dio dio = Dio(BaseOptions(baseUrl: Config.baseUrl));

    try {
      final result = type == 'get'
          ? await dio.get(path)
          : await dio.post(path, data: data);
      return result.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
