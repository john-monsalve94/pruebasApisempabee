// colmenas_service.dart
import 'package:dio/dio.dart';
import 'package:empabee/services/token_service.dart';
// import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:empabee/vistas/screens/screens.dart';

class ColmenasService {
  final Dio _dio = Dio();
  final String baseUrl = apiUrl;

  Future<List<ColmenaModel>> getColmenas(int? limit, int? page) async {
    try {
      // Configurar los encabezados de la solicitud HTTP con el JWT
      //dio tiene a options el cual nos permite crear el header para mandarlo y consultar lo que queremos pero con el token
      // print('antes de entrar al header');
      // final token = _tokenService.getToken();
      // print(token);
      String url = '$baseUrl/v1/colmenas';
      if (limit != null && page != null) {
        url = '$url?limit=$limit&page=$page';
      } else if (limit != null) {
        url = '$url?limit=$limit';
      } else if (page != null) {
        url = '$url?page=$page';
      }
      Options options = await TokenService.getOptions();
      final Response response =
          // aqui el header esta guardado en options y se le pasa con la peticion para deje acceder al servidor
          await _dio.get(url, options: options);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final List<dynamic> colmenasData = responseData["data"];
        final List<ColmenaModel> colmenas =
            colmenasData.map((json) => ColmenaModel.fromJson(json)).toList();

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

  Future<void> postData() async {
    try {
      final response =
          await _dio.post('$baseUrl/v1/colmenas', data: PaginatorModel);

      print(response);
      return response.data;
    } catch (e) {
      throw Exception('No se puedo crear la colmena: $e');
    }
  }
}
