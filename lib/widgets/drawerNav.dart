import 'package:empabee/services/Auth_Service.dart';
import 'package:empabee/services/perfil_service.dart';
import 'package:empabee/services/token_service.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerNav extends StatefulWidget {
  final String nombre;
  final String correo;

  const DrawerNav({Key? key, required this.nombre, required this.correo})
      : super(key: key);

  @override
  State<DrawerNav> createState() => _DrawerNavState();
}

class _DrawerNavState extends State<DrawerNav> {
  final imageInternet =
      'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/e40b6ea6361a1abe28f32e7910f63b66/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg';
  String nombrePerfil = '';

  @override
  Widget build(BuildContext context) {
    AuthService _autthservice = AuthService();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: Colors.amber,
            child: SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(imageInternet),
                      radius: 60,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.nombre),
                  ),
                  Text(widget.correo)
                ],
              ),
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
