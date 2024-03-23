
import 'package:empabee/config/router/app_router.dart';
import 'package:empabee/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      child: MaterialApp.router(
        routerConfig: appRouter,
          debugShowCheckedModeBanner: false,
          theme: AppTheme(selectedColor: 1).getTheme(),
      
          ),
    );
  }
}
