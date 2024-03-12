// colmenas_service.dart
import 'package:dio/dio.dart';
import 'package:empabee/services/token_service.dart';
// import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:empabee/vistas/screens/screens.dart';

class ColmenasService {
  final Dio _dio = Dio();
  final String baseUrl = apiUrl;
  final TokenService _tokenService = TokenService();

  Future<List<ColmenasModels>> getColmenas() async {
    try {
      // Configurar los encabezados de la solicitud HTTP con el JWT
      //dio tiene a options el cual nos permite crear el header para mandarlo y consultar lo que queremos pero con el token
      // print('antes de entrar al header');
      // final token = _tokenService.getToken();
      // print(token);
      Options options =  Options( headers: {
        'Authorization': 'Bearer ${await _tokenService.getToken()}',
        'Accept': 'application/json'
      });
      final Response response =
          // aqui el header esta guardado en options y se le pasa con la peticion para deje acceder al servidor
          await _dio.get('$baseUrl/v1/colmenas', options: options);
      if (response.statusCode == 200) {
        final List<dynamic> colmenasData = response.data;
        final List<ColmenasModels> colmenas =
            colmenasData.map((json) => ColmenasModels.fromJson(json)).toList();
        return colmenas;
      } else {
        throw Exception('Error al obtener las colmenas');
      }
    } catch (e) {
      throw Exception('Error en la solicitud: $e');
    }
  }
}
