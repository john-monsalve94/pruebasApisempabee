// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AppBarEmpabee extends StatelessWidget implements PreferredSizeWidget {
  final String pageTitle;

  const AppBarEmpabee({Key? key, required this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      
      title: Text(pageTitle),
      actions: [
        Icon(Icons.notifications),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(Icons.account_circle,
          size: 30,),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
