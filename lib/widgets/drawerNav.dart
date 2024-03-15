import 'package:empabee/services/Auth_Service.dart';
import 'package:empabee/services/token_service.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService _autthservice = AuthService();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 200,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
          ),
          ListTile(
              title: Text('Perfil'),
              onTap: () => context.go('/colmenas/perfil')),
          ListTile(
            title: Text('Notificaciones'),
            onTap: () => context.go('/colmenas/notificaciones'),
          ),
          ListTile(
            title: Text('Cerrar Sesión'),
            onTap: () {
              // final ver = AuthService().obtenerToken();
              TokenService().deleteToken().then((value) {
                AuthService.obtenerToken(context);
                
              });
              
            },
          )
        ],
      ),
    );
  }
}
