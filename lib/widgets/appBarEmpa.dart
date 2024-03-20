// ignore_for_file: type_literal_in_constant_pattern

import 'dart:async';
import 'dart:html';

import 'package:empabee/models/colmenas_models.dart';
import 'package:empabee/screens/colmenaEspecifica/colmenaEsp_sreen.dart';
import 'package:empabee/screens/colmenas/colmenas_screen.dart';
import 'package:empabee/screens/configuracion/configuracion_screen.dart';
import 'package:empabee/screens/estadoColmena/estadoColmena_screen.dart';
import 'package:empabee/screens/estadoGeneral/estadoGeneral_screen.dart';
import 'package:empabee/screens/notifications/notificaciones_Screen.dart';
import 'package:empabee/screens/perfil/perfil_Screen.dart';
import 'package:empabee/screens/produccionColmena/produccionColmena_screen.dart';
import 'package:empabee/screens/produccionGeneral/produccionGeneral_screen.dart';
import 'package:empabee/screens/screens.dart';
import 'package:empabee/screens/siembraColmena/siembraColmena_screen.dart';
import 'package:empabee/screens/siembraproduccion/siembraProduccion_screen.dart';
import 'package:empabee/services/perfil_service.dart';
import 'package:empabee/widgets/drawerNav.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarEmpa extends StatefulWidget implements PreferredSizeWidget {
  // final Widget? appBar;
  // final Widget? drawer;
    final Widget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final PreferredSizeWidget? appBarPreferredSize;
  final double? appBarElevation;
  final ShapeBorder? appBarShape;
  final double? appBarTitleSpacing;
  final SystemUiOverlayStyle? appBarSystemOverlayStyle;
  final Brightness? appBarBrightness;
  final Color? appBarBackgroundColor;
  final Color? appBarForegroundColor;
  final IconThemeData? appBarIconTheme;
  final TextTheme? appBarTextTheme;
  final bool? appBarPrimary;
  final bool? appBarCenterTitle;
  final bool? appBarAutomaticallyImplyLeading;
  final Widget? appBarLeading;
  final Widget? appBarTitle;
  final Widget? appBarActions;
  final bool? appBarFlexibleSpace;
  final double? appBarToolbarHeight;
  final double? appBarTitleHeight;
  final Widget? appBarBottom;
  final bool appBarExcludeHeaderSemantics;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final bool primary;
  final DragStartBehavior drawerDragStartBehavior;



  final int? id;
  final String? colmena;
  final String? colmenaConfiguracion;
  final String? colmenaProduccion;
  final String? colmenaEstado;
  final String? colmenaSiembra;
  final String? colmenaSiembraProduccion;
  final String? produccionGeneral;
  final String? estadoGeneral;

  const AppBarEmpa({
    Key? key,
    // this.appBar,
    // this.drawer,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.appBarPreferredSize,
    this.appBarElevation,
    this.appBarShape,
    this.appBarTitleSpacing,
    this.appBarSystemOverlayStyle,
    this.appBarBrightness,
    this.appBarBackgroundColor,
    this.appBarForegroundColor,
    this.appBarIconTheme,
    this.appBarTextTheme,
    this.appBarPrimary,
    this.appBarCenterTitle,
    this.appBarAutomaticallyImplyLeading,
    this.appBarLeading,
    this.appBarTitle,
    this.appBarActions,
    this.appBarFlexibleSpace,
    this.appBarToolbarHeight,
    this.appBarTitleHeight,
    this.appBarBottom,
    this.appBarExcludeHeaderSemantics = false,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,

    this.id,
    this.colmena,
    this.colmenaConfiguracion,
    this.colmenaProduccion,
    this.colmenaEstado,
    this.colmenaSiembra,
    this.colmenaSiembraProduccion,
    this.produccionGeneral,
    this.estadoGeneral,
  }) : super(key: key);

  @override
  State<AppBarEmpa> createState() => _AppBarEmpaState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class _AppBarEmpaState extends State<AppBarEmpa> {
  String nombrePerfil = '';
  String correoPerfil = '';

  @override
  void initState() {
    super.initState();
    cargarDatosPerfil(); // Llama a la función para cargar los datos del perfil al iniciar el widget
  }

  void cargarDatosPerfil() {
    PerfilService.getPerfil().then((datosPerfil) {
      final String nombre = datosPerfil.primerNombre;
      final String correo = datosPerfil.email;
      setState(() {
        nombrePerfil =
            nombre; // Actualiza el estado con el nombre del perfil obtenido
        correoPerfil = correo;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // final ColmenasService datosColmena = ColmenasService();

    //  bool esColmenasScreen = context.widget is ColmenasScreen;
    // bool esProduccionGeneralScreen = context.widget is ProduccionGeneral_screen;

    // bool esEstadoGeneralScreen = context.widget is EstadoGeneral_screen;

    // String tituloGeneral = esProduccionGeneralScreen ? 'Estado General';
    // String tituloEspecifico = esColmenasScreen ? 'Bienvenido a Empabee' : 'nombreColmena';

    String titulo;
    switch (context.widget.runtimeType) {
      case ProduccionGeneral_screen:
        titulo = 'Producción General';
        break;
      case EstadoGeneral_screen:
        titulo = 'Estado General';
        break;
      case ColmenaEspe_screen:
        titulo = widget.colmena!;
        break;
      case SiembraColmena_screen:
        titulo = '${widget.colmena}/${widget.colmenaSiembra}';
        break;
      case EstadoColmena_screen:
        titulo = '${widget.colmena}/${widget.colmenaEstado}';
        break;
      case Configusracion_screen:
        titulo = '${widget.colmena}/${widget.colmenaConfiguracion}';
        break;
      case Produccioncolmena_screen:
        titulo = '${widget.colmena}/${widget.colmenaProduccion}';
        break;
      case SiembraProduccion_screen:
        titulo =
            '${widget.colmena}/${widget.colmenaSiembra}/${widget.colmenaSiembraProduccion}';
        break;
      case PerfilScreen:
        titulo = 'Perfil';
        break;
      case NotificationScreen:
        titulo = 'Notificaciones';
        break;
      default:
        titulo = 'Bienvenido a EmpaBee';
        break;
    }

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
      
    );
  }
  
}
