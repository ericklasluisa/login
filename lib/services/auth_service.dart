import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String _baseUrl = 'http://localhost';

  // Método para iniciar sesión
  static Future<dynamic> login(String email, String password) async {
    final url = Uri.parse('$_baseUrl/login/');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error de conexión: $e');
      return null;
    }
  }

  // Método para registrar un nuevo usuario
  static Future<String?> register(
      String userName, String email, String password) async {
    final url = Uri.parse('$_baseUrl/login/registro.php');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'user_name': userName,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return null; // Éxito
      } else {
        final data = jsonDecode(response.body);
        return data['error'] ?? 'Error desconocido';
      }
    } catch (e) {
      print('Error de conexión: $e');
      return 'Error de conexión';
    }
  }
}
