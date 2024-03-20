import 'package:empabee/screens/colmenaEspecifica/colmenaEsp_sreen.dart';
import 'package:empabee/screens/notifications/notificaciones_Screen.dart';
import 'package:empabee/screens/perfil/perfil_Screen.dart';
import 'package:empabee/screens/screens.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
        path: '/colmenas',
        builder: (context, state) => ColmenasScreen(),
        routes: [
          GoRoute(
            path: 'perfil',
            builder: (context, state) => const PerfilScreen(),
          ),
          GoRoute(
            path: 'notificaciones',
            builder: (context, state) => const NotificationScreen(),
          ),
          GoRoute(
            path: 'colmenaEspecifica/:id',
            builder: (context, state) =>  ColmenaEspe_screen(id:int.parse(state.pathParameters['id']!)),
          ),
        ]),
    GoRoute(
      path: '/graficas',
      builder: (context, state) => const GraficasScreen(),
    ),
  ],
);
