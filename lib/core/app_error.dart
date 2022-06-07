import 'package:dio/dio.dart';

class DioException implements Exception {
  DioException.fromDioError(DioError dioerror) {
    switch (dioerror.type) {
      case DioErrorType.other:
        message = "No internet connection";
        break;
      case DioErrorType.response:
        message = _handleError(
            dioerror.response!.statusCode!, dioerror.response!.data);
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }
  String? message;
  String _handleError(int statuscode, dynamic error) {
    switch (statuscode) {
      case 400:
        return error["message"];
      case 404:
        return error["message"] ?? "Not found";
      case 500:
        return "Internal server error";
      default:
        return "Something went wrong";
    }
  }
}
