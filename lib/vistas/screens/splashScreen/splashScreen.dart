// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    GoRouter.of(context).go('/login');
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    );

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/splashEmpa.png',
                width: animation.value * 450,
                height: animation.value * 450,
              ),
              SizedBox(height: 45),
              // Text(
              //   'EmpaBee',
              //   style: TextStyle(
              //     color: Color(0xFFFBD78C),
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),

            ],
          ),
        ],
      ),
    );
  }
}
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {

//   @override
//   Widget build(BuildContext context) {
//     String location = '';
//     Future.delayed(Duration(seconds: 2), () async {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String token = prefs.getString('token') ?? '';
//       print(token);
//       location = token.isNotEmpty ? '/colmenas' : '/login';
//     }).then((value) => context.go(location));
//     return Scaffold(
//       body: (Center(
//         child: Text('Splash Empabee'),
//       )),
//     );
//   }
// }