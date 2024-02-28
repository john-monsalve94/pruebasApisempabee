import 'package:empabee/menu/menu_items.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('colmenas y graficas'),
        // centerTitle: true,
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView(
      // { super.key,} no lo voy a usar por ser privado y unica referencia
      );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: appMenuItems.length,
        itemBuilder: (context, index) {
          final menuItem = appMenuItems[index];
          return ListTile(
            title: Text(menuItem.title),
            subtitle: Text(menuItem.subtitle),
          );
        });
  }
}
