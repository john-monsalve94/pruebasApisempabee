import 'package:dio/dio.dart';
import 'package:empabee/presentation/screens/screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  final _dio = Dio();

  Future<void> login(FormData data) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String loginUrl = '$apiUrl/auth/login';
      final Response response = await _dio.post(loginUrl,data:data);
      if (response.data['access_token']!=null) {
        prefs.setString('token', response.data['access_token']);
      }
    } catch (e) {
      rethrow;
    }
  }
}


