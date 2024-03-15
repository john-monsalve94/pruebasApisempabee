import 'package:dio/dio.dart';
import 'package:empabee/vistas/screens/screens.dart';
import 'package:empabee/services/token_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  static void obtenerToken(BuildContext context) {
    TokenService.getToken().then((token) {
      if (token != null) {
        final tokenConBearer = 'Bearer $token';
        print(
            'El token es: $tokenConBearer'); // Imprimir el token en la consola
        context.go('/colmenas');
      } else {
        context.go('/login');
        print(
            'No hay token disponible'); // Manejar el caso en el que no haya ningún token guardado
      }
    }); // Obtener el token utilizando el servicio TokenService
  }
}


// class AuthService {
//   final _dio = Dio();
//   Future<Map<String, dynamic>> login(String email, String password) async {
//     try {
//       final response = await _dio.post('$apiUrl/auth/login',
//           data: {'email': email, 'password': password});
//       return response.data;
//     } catch (e) {
//       throw Exception('Failed to log in: $e');
//     }
//   }
// }



// class LoginService {
//   final _dio = Dio();

//   Future<void> login(FormData data) async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String loginUrl = '$apiUrl/auth/login';
//       final Response response = await _dio.post(loginUrl, data: data);
//       if (response.data['access_token'] != null) {
//         prefs.setString('token', response.data['access_token']);
//         print('este es el token' + response.data['access_token']);
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
