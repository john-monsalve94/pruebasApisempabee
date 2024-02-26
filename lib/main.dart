import 'package:empabee/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 0).getTheme(),
        home: Scaffold(
          body: Center(
            child: FilledButton(
              child: const Text('hola color'),
              onPressed: () {},
            ),
          ),
        ));
  }
}
