// ignore_for_file: type_literal_in_constant_pattern, file_names, avoid_print
import 'package:empabee/services/perfil_service.dart';
import 'package:empabee/widgets/drawerNav.dart';
import 'package:flutter/material.dart';

class AppBarEmpa extends StatefulWidget implements PreferredSizeWidget {
  final Widget? appBar;
  final Widget body;

  final int? id;
  final String titulo;

  final Widget? floatingActionButton;

  const AppBarEmpa({
    super.key,
    this.appBar,
    this.floatingActionButton ,
    required this.body,
    this.id,
    required this.titulo,

  });

  @override
  State<AppBarEmpa> createState() => _AppBarEmpaState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarEmpaState extends State<AppBarEmpa> {
  String nombrePerfil = '';
  String correoPerfil = '';

  @override
  void initState() {
    super.initState();
    cargarDatosPerfil();
  }

  void cargarDatosPerfil() {
    PerfilService.getPerfil().then((datosPerfil) {
      setState(() {
        nombrePerfil = datosPerfil.primerNombre;
        correoPerfil = datosPerfil.email;
      });
    }).catchError((error) {
      print('Error al cargar datos del perfil: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(context);
    String titulo = widget.titulo;

    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
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
      ),
      endDrawer: DrawerNav(
        nombre: nombrePerfil,
        correo: correoPerfil,
      ),
      body: widget.body,
      floatingActionButton:widget.floatingActionButton,
    );
  }
}
