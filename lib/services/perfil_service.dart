import 'dart:async';

import 'package:dio/dio.dart';
import 'package:empabee/env/env.dart';
import 'package:empabee/models/perfil_models.dart';
import 'package:empabee/services/token_service.dart';

import 'package:dio/dio.dart';
import 'package:empabee/env/env.dart';
import 'package:empabee/models/perfil_models.dart';
import 'package:empabee/services/token_service.dart';

class PerfilService {
  final _dio = Dio();

  static Future<PerfilModel> getPerfil() async {
    try {
      final perfilService = PerfilService();
      Options options = await TokenService.getOptions();
      final response = await perfilService._dio
          .post('$apiUrl/auth/perfil', options: options);

      if (response.statusCode == 200) {
        final jsonBody = response.data;
        return PerfilModel.fromJson(jsonBody);
      } else {
        throw Exception('Error al obtener el perfil del usuario');
      }
    } catch (e) {
      throw Exception('Error al obtener el perfil del usuario: $e');
    }
  }

static Future<Map<String, String>> cargarDatosPerfil() async {
  Completer<Map<String, String>> completer = Completer();

  try {
    final datosPerfil = await getPerfil();
    final String nombre = datosPerfil.primerNombre;
    final String correo = datosPerfil.email;

    completer.complete({
      'nombre': nombre,
      'correo': correo
    });
  } catch (error) {
    completer.completeError('Error al cargar los datos del perfil: $error');
  }

  return completer.future;
}

}
