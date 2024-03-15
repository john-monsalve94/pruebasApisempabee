// colmenas_service.dart
import 'package:dio/dio.dart';
import 'package:empabee/services/token_service.dart';
// import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:empabee/vistas/screens/screens.dart';

class ColmenasService {
  final Dio _dio = Dio();
  final String baseUrl = apiUrl;

  Future<List<Datum>> getColmenas() async {
    try {
      // Configurar los encabezados de la solicitud HTTP con el JWT
      //dio tiene a options el cual nos permite crear el header para mandarlo y consultar lo que queremos pero con el token
      // print('antes de entrar al header');
      // final token = _tokenService.getToken();
      // print(token);
      Options options = Options(headers: {
        'Authorization': 'Bearer ${await TokenService.getToken()}',
        'Accept': 'application/json'
      });
      final Response response =
          // aqui el header esta guardado en options y se le pasa con la peticion para deje acceder al servidor
          await _dio.get('$baseUrl/v1/colmenas', options: options);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final List<dynamic> colmenasData = responseData["data"];
        final List<Datum> colmenas =
            colmenasData.map((json) => Datum.fromJson(json)).toList();

        // final List<dynamic> colmenasData = response.data;
        // final List<Datum> colmenas =
        //     colmenasData.map((json) => Datum.fromJson(json)).toList();
        return colmenas;
      } else {
        throw Exception('Error al obtener las colmenas');
      }
    } catch (e) {
      throw Exception('Error en la solicitud: $e');
    }
  }
}
