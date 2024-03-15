import 'package:empabee/vistas/notifications/notificacionesScreen.dart';
import 'package:empabee/vistas/screens/perfil/perfilScreen.dart';
import 'package:empabee/vistas/screens/screens.dart';
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
        ]),
    GoRoute(
      path: '/graficas',
      builder: (context, state) => const GraficasScreen(),
    ),
  ],
);
