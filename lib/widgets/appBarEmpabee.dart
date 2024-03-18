// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:empabee/screens/perfil/perfilScreen.dart';
import 'package:empabee/widgets/drawerNav.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarEmpabee extends StatelessWidget implements PreferredSizeWidget {
  final String pageTitle;

  const AppBarEmpabee({Key? key, required this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(

      backgroundColor: Color(0xFFFBD78C),
      title: Text(pageTitle),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(
            onPressed: () => context.go('/colmenas/perfil'),
            icon: Icon(
              Icons.account_circle,
              size: 40,
              color: Color.fromARGB(255, 189, 149, 39),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
