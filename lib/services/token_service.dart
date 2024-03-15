import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  static const _tokenKey = 'token';

  // Método para guardar el token en el almacenamiento local
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  // Método para obtener el token del almacenamiento local
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(TokenService._tokenKey);
  }

  // Método para eliminar el token del almacenamiento local
  Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(TokenService._tokenKey);
  }

  static void isExpired(BuildContext context) {
    TokenService.getToken().then((String? token) {
      if (token != null) {
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
        int expiracion = decodedToken['exp'] as int;
        int inicio = decodedToken['iat'] as int;

        if (expiracion < inicio) {
          context.go('/colmenas');
        }
      } else {
        context.go('/login');
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('El token se expirado'),
                  content: Text('Profavor vuelve a iniciar sessión'),
                  actions: [
                    TextButton(
                        onPressed: () => 
                        context.go('/login'),
                        child: Text('Ok'))
                  ],
                ));
      }
    });
  }
}
