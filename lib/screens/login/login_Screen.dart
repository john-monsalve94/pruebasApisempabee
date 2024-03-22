// ignore_for_file: file_names, use_build_context_synchronously

import 'package:empabee/services/Auth_Service.dart';
import 'package:empabee/services/token_service.dart';
import 'package:empabee/widgets/textoInicioEmpabee.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthService authService = AuthService();
  bool _isLoading = false;


  Future<void> _login() async {
    // Cuando el usuario toca el botón de inicio de sesión, la aplicación comienza a verificar si el correo electrónico y la contraseña son correctos.
    setState(() {
      _isLoading = true;
    });

    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    try {
      // print('antes de entar al servicio');
      final authService = AuthService();
      final response = await authService.login(email, password);

      if (response['access_token'] != null) {
        final token = response['access_token'];
        await TokenService.saveToken(token);
        // final savedToken = await TokenService.getToken();

        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
        // print('olaaaaaaaaaaaa');
        // ignore: avoid_print
        print(decodedToken);

        // final userId = decodedToken['user_id'];
        // final username = decodedToken['username'];
        // final email = decodedToken['email'];

        AuthService()
            .login(email, password)
            .then((value) => context.go('/colmenas'));
      } 
    } catch (e) {
      // ignore: avoid_print
      print('Error durante la autenticación: $e');
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Error de autenticación'),
      content: Text('Ocurrió un error durante el inicio de sesión. Por favor, inténtalo de nuevo más tarde.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Cerrar el diálogo
          },
          child: Text('Aceptar'),
        ),
      ],
    ),
  );
      
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          
          children: [
            SizedBox(
                height: 250,
                width: 250,
                child: Image.asset('assets/images/loginPortadaLogo.png')
                ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: InicioEmpabee(),
            ),
            // SizedBox(
            //   height: 16,
            // ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16,left: 8),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Correo',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 16,
            // ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16,left: 8),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Ingresa tu correo',
                    prefixIcon: Icon(Icons.email, color: Color(0xFFF7A733))),
                controller: _emailController,
              ),
            ),
            // SizedBox(
            //   height: 16,
            // ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(bottom: 16,left: 8),
                  child: Text(
                    'Contraseña',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 16,
            // ),
            Padding(
              padding:  EdgeInsets.only(bottom: 40,left: 8),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Ingresa tu Contraseña',
                    prefixIcon: Icon(Icons.lock, color: Color(0xFFF7A733))),
                controller: _passwordController,
                obscureText: true,
              ),
            ),
            // SizedBox(
            //   height: 40,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _isLoading ? null : _login,
                  child: _isLoading
                      ? CircularProgressIndicator()
                      : Text('Iniciar sesión'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
