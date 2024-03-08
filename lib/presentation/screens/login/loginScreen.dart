import 'package:dio/dio.dart';
import 'package:empabee/services/login_services.dart';
import 'package:empabee/presentation/screens/screens.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreens extends StatelessWidget {
  LoginScreens({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' '),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/LogoEmpabee.png'),
              SizedBox(
                height: 40,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Correo Electronico',
                    prefixIcon: Icon(Icons.email)),
                controller: emailController,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Contraseña', prefixIcon: Icon(Icons.lock)),
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    FormData data = FormData.fromMap({
                      'email': emailController.text,
                      'password': passwordController.text
                    });
                    LoginService()
                        .login(data)
                        .then((value) => context.go('/colmenas'));
                  },
                  child: Text('Iniciar Sesion'))
            ],
          ),
        ),
      ),
    );
  }
}
