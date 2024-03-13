
import 'package:flutter/material.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          
          ListTile(
            title: Text('Perfil'),
            onTap: (){},
          ),
                    ListTile(
            title: Text('Notificaciones'),
            onTap: (){},
          ),
                    ListTile(
            title: Text('Cerrar Sesión'),
            onTap: (){},
          )
        ],
      ),
    );
  }
}