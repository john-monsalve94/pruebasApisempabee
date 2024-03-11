import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  static const _tokenKey = 'token';

  // Método para guardar el token en el almacenamiento local
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  // Método para obtener el token del almacenamiento local
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // Método para eliminar el token del almacenamiento local
  Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
