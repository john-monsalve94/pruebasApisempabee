
import 'package:empabee/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';


// GoRouter configuration
final appRouter = GoRouter(
  // initialLocation: '/',
  routes: [   
    GoRoute(
      path:'/',
      builder:(context, state) => const SplashScreen(),
      ),
    GoRoute(
      path: '/login',
      builder: (context, state) =>  LoginScreens(),
      ),
  
      
    
        GoRoute(
      path: '/colmenas',
      builder: (context, state) =>  ColmenasScreen(),
      
    ),
        GoRoute(
      path: '/graficas',
      builder: (context, state) => const GraficasScreen(),
      
    ),

  ],
);