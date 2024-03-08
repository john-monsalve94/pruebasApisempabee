// colmenas_service.dart
import 'package:dio/dio.dart';
// import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:empabee/presentation/screens/screens.dart';

class ColmenasService {
  final Dio _dio = Dio();
  final String baseUrl = apiUrl;

  Future<List<ColmenasModels>> getColmenas() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token')!;

      // Configurar los encabezados de la solicitud HTTP con el JWT
      Options options = Options(headers: {'Authorization': 'Bearer $token','Accept':'application/json'});
      final Response response = await _dio.get('$baseUrl/v1/colmenas', options: options);

      if (response.statusCode == 200) {
        // print(response.data.runtimeType);
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
// class ColmenasService {
//   final Dio _dio = Dio();
//   final Logger _logger = Logger();
//   String url = '';
//   Future<List<ColmenasModels>> getColmenas() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String token = prefs.getString('access_token') ?? '';

//       Response response = await _dio.get(
//         '/v1/colmenas',
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );

//       if (response.statusCode == 200) {
//         dynamic responseData = json
//             .decode(response.data); // Convertir la respuesta a un objeto JSON
//         List<dynamic> colmenasData = responseData[
//             'colmenas']; // Obtener la lista de colmenas desde el objeto
//         List<ColmenasModels> colmenas =
//             colmenasData.map((json) => ColmenasModels.fromJson(json)).toList();
//         return colmenas;
//       } else {
//         throw Exception('Error al obtener las colmenas');
//       }
//     } catch (e) {
//       throw Exception('Error en la solicitud: $e');
//     }
//   }
// }
