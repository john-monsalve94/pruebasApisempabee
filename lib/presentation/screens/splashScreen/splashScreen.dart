// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String location = '';
    Future.delayed(Duration(seconds: 2), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      print(token);
      location = token.isNotEmpty ? '/login' : '/login';
    }).then((value) => context.go(location));
    return Scaffold(
      body: (Center(
        child: Text('Splash Empabee'),
      )),
    );
  }
}
