// ignore_for_file: file_names, avoid_print

import 'package:dio/dio.dart';
import 'package:empabee/screens/screens.dart';
import 'package:empabee/services/token_service.dart';

class AuthService {
  final _dio = Dio();
  // final TokenService _tokenService = TokenService();

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _dio.post('$apiUrl/auth/login',
          data: {'email': email, 'password': password});
      final token = response.data['access_token'];
      await TokenService.saveToken(token);

      return response.data;
    } catch (e) {
      throw Exception('Failed to log in: $e');
    }
  }

  static Future<String> obtenerToken() async {
    try {
      final token = await TokenService.getToken();
      if (token != null) {
        final tokenConBearer = 'Bearer $token';
        print('El token es: $tokenConBearer');
        return '/colmenas'; // Devolver la ruta deseada
      } else {
        print('No hay token disponible');
        return '/login'; // Devolver la ruta deseada
      }
    } catch (e) {
      print('Error al obtener el token: $e');
      return '/error'; // Devolver la ruta deseada en caso de error
    }
  }
}
