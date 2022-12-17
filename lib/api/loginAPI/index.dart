import 'package:biofresh/api/baseAPI/index.dart';
import 'package:biofresh/common/helpers.dart';

class Login {
  final ApiClient apiClient = ApiClient();
  final LoginData loginData = LoginData();

  Future<String> login(String email, String password) async {
    final api = await apiClient.api();
    final payload = {"email": email, "password": password};
    final response = await api.post('/login', data: payload);
    var responseData = response.data;
    final token = responseData['token'];
    loginData.storeToken(token);
    return token; 
  }
}
