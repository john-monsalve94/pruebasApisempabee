import 'package:dio/dio.dart';
import 'package:empabee/env/env.dart';
import 'package:empabee/models/perfil_models.dart';
import 'package:empabee/services/token_service.dart';

class PerfilService {
  final _dio = Dio();
  Future<PerfilModel> getPerfil() async {
    try {
      Options options = await TokenService.getOptions();
      final response = await _dio.post('$apiUrl/auth/perfil', options: options);

      if (response.statusCode == 200) {
        final jsonBody = response.data;
        return PerfilModel.fromJson(jsonBody);
      } else {
        throw Exception('Error aaql obtener el perfil del usuario');
      }
    } catch (e) {
      throw Exception('Error al obtener el perfil del usuario: $e');
    }
  }

  Future<Map<String, dynamic>> obtenerTodosLosDatos() async {
    final perfil = await getPerfil();
    return {
      'nombre': perfil.primerNombre +' '+ perfil.segundoNombre,
      'correo':perfil.email,

    };
  }

}
