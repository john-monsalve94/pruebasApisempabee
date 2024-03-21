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
      name: 'Splash',
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
        name: 'colmenas',
        path: '/colmenas',
        builder: (context, state) => ColmenasScreen(),
        routes: [
          GoRoute(
            name: 'perfil',
            path: 'perfil',
            builder: (context, state) => const PerfilScreen(),
          ),
          GoRoute(
            name: 'notificaciones',
            path: 'notificaciones',
            builder: (context, state) => const NotificationScreen(),
          ),
          GoRoute(
            name: 'colmenas/colmena',
            path: 'colmena/:id/:nombre',
            builder: (context, state) => ColmenaEspe_screen(
              id: int.parse(state.pathParameters['id']!),
              nombre: state.pathParameters['nombre']!,
            ),
          ),
        ]),
    GoRoute(
      path: '/graficas',
      builder: (context, state) => const GraficasScreen(),
    ),
  ],
);
