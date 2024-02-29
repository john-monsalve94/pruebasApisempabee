import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItems(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItems>[
MenuItems(
    title: 'colmenas',
    subtitle: 'colmenas',
    link: '/colmenas',
    icon: Icons.smart_button_outlined
    ),
MenuItems(
    title: 'Graficas',
    subtitle: 'graficas generales',
    link: '/graficas',
    icon: Icons.hive_outlined
    )
];
