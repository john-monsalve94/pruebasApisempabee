
import 'package:empabee/vistas/screens/perfil/perfil.dart';
import 'package:empabee/vistas/screens/screens.dart';
import 'package:go_router/go_router.dart';


// GoRouter configuration
final appRouter = GoRouter(
  // initialLocation: '/',
  routes: [   
    GoRoute(
      path:'/',
      builder:(context, state) =>  SplashScreen(),
      ),
    GoRoute(
      path: '/login',
      builder: (context, state) =>  LoginScreen(),
      ),
  
      
    
        GoRoute(
      path: '/colmenas',
      builder: (context, state) =>  ColmenasScreen(),
      
    ),
        GoRoute(
      path: '/graficas',
      builder: (context, state) => const GraficasScreen(),
      
    ),
            GoRoute(
      path: '/perfil',
      builder: (context, state) => const perfilScreen(),
      
    ),

  ],
);