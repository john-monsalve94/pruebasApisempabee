// ignore_for_file: prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';

class NavFooter extends StatefulWidget {
  const NavFooter({super.key});

  @override
  State<NavFooter> createState() => _NavFooterState();
}

class _NavFooterState extends State<NavFooter> {

  void _onItemTapped(int index) {
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 238, 155, 0),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap:_onItemTapped,
          items: [
            BottomNavigationBarItem(
        
              label:'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label:'Estado',
              icon: Icon(Icons.stacked_bar_chart),
            ),
            BottomNavigationBarItem(
              label: 'Producción',
              icon: Icon(Icons.stacked_line_chart_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
