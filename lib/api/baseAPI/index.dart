import 'package:biofresh/common/constants.dart';
import 'package:dio/dio.dart';
import 'package:biofresh/common/helpers.dart';

class ApiClient {
  final LoginData loginData = LoginData();
  final Dio dio = Dio();
  
  Future<Dio> api() async {
    final token = await loginData.getStoredToken();
    dio.options.headers['Authorization'] = token;
    dio.options.baseUrl = BASE_URL;
    return dio;
  }
}
