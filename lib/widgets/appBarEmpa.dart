import 'package:flutter/material.dart';

class AppBarEmpa extends StatelessWidget implements PreferredSizeWidget {
  const AppBarEmpa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Bienvenido a Empabee'),
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.account_circle),
            iconSize: 30,
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
