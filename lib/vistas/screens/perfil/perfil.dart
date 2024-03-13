import 'package:empabee/widgets/cajonEmpa.dart';
import 'package:flutter/material.dart';

class perfilScreen extends StatelessWidget {
  const perfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('perfil'),
      // ),
      body: _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return DrawerPage(title: 'Perfil john');
  }
}
