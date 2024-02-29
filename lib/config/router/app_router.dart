
import 'package:empabee/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';


// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      
    ),
        GoRoute(
      path: '/colmenas',
      builder: (context, state) => const ColmenasScreen(),
      
    ),
        GoRoute(
      path: '/graficas',
      builder: (context, state) => const GraficasScreen(),
      
    ),
  ],
);