import 'package:empabee/services/Auth_Service.dart';
import 'package:empabee/services/token_service.dart';
import 'package:empabee/widgets/textoInicioEmpabee.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  TokenService tokenService = TokenService();

  Future<void> _login() async {
    // Cuando el usuario toca el botón de inicio de sesión, la aplicación comienza a verificar si el correo electrónico y la contraseña son correctos.
    setState(() {
      _isLoading = true;
    });

    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    try {
      print('antes de entar al servicio');
      final authService = AuthService();
      final response = await authService.login(email, password);

      if (response['access_token'] != null) {
        final token = response['access_token'];
        await tokenService.saveToken(token);
        final savedToken = await tokenService.getToken();

        // Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
        // print('olaaaaaaaaaaaa');
        // print(decodedToken);

        // final userId = decodedToken['user_id'];
        // final username = decodedToken['username'];
        // final email = decodedToken['email'];

        AuthService()
            .login(email, password)
            .then((value) => context.go('/colmenas'));
      } else {
        // Error en el inicio de sesión
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Usuario o contraseña inválidos'),
            actions: [
              TextButton(
                onPressed: () => GoRouter.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Error'),
                content: Text('Credenciales Incorrectas'),
                actions: [
                  TextButton(
                      onPressed: () => GoRouter.of(context).pop(),
                      child: Text('Ok'))
                ],
              ));
      print('Error al iniciar sesión o al obtener el token: $e');
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  // height: 350,
                  // width: 350,
                  child: Image.asset('assets/images/loginPortadaLogo.png')),
              InicioEmpabee(),
              SizedBox(
                height: 16,
              ),
              Row(
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
              SizedBox(
                height: 16,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Ingresa tu correo',
                    prefixIcon: Icon(Icons.email, color: Color(0xFFF7A733))),
                controller: _emailController,
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Contraseña',
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
              SizedBox(
                height: 16,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Ingresa tu Contraseña',
                    prefixIcon: Icon(Icons.lock, color: Color(0xFFF7A733))),
                controller: _passwordController,
                obscureText: true,
              ),
              SizedBox(
                height: 80,
              ),
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
      ),
    );
  }
}
