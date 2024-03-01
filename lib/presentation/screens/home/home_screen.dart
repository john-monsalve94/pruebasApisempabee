import 'package:empabee/config/menu/menu_items.dart';
import 'package:empabee/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


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
        physics: BouncingScrollPhysics(),
        itemCount: appMenuItems.length,
        itemBuilder: (context, index) {
          final menuItem = appMenuItems[index];
          final color = colorList[(selectedColor: 0).selectedColor];
          return _CustomListTitle(menuItem: menuItem, color: color);
        });
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    // super.key,
    required this.menuItem,
    required this.color,
  });

  final MenuItems menuItem;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          Icon(menuItem.icon, color: color), //Color.fromARGB(255, 247, 167, 51)
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: color),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subtitle),
      onTap: () {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => ColmenasScreen()));
        // Navigator.pushNamed(context, menuItem.link);
        context.push(menuItem.link);
      },
    );
  }
}
