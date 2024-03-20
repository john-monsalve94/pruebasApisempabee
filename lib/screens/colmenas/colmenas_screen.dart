// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:empabee/models/perfil_models.dart';
import 'package:empabee/screens/perfil/perfil_Screen.dart';
import 'package:empabee/services/perfil_service.dart';
import 'package:empabee/widgets/appBarEmpa.dart';

import 'package:empabee/widgets/cards_colmenas.dart';
import 'package:empabee/widgets/drawerNav.dart';
import 'package:empabee/widgets/navFooterEmpabee.dart';

import 'package:flutter/material.dart';
import 'package:empabee/screens/screens.dart';

class ColmenasScreen extends StatefulWidget {
  @override
  _ColmenasScreenState createState() => _ColmenasScreenState();
}

class _ColmenasScreenState extends State<ColmenasScreen> {
  //aqui declaro las variables que voy a usar para cargar algo de perfil, y late,esta disponible cuando se quiera usar
  String nombrePerfil = '';
  String correoPerfil = '';
  late final perfilService = PerfilService();
  //.............................................
  // aqui inicializo antes de  entrar al wisget y que quiero tener para hacerla
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
    return Scaffold(
      appBar: AppBarEmpa(),
      endDrawer: DrawerNav(
        nombre: nombrePerfil,
        correo: correoPerfil,
      ),
      body: FutureBuilder<List<ColmenaModel>>(
        future: ColmenasService().getColmenas(8,
            1), // para manejar el nummero  de colmenas que voy a mostrar en la pagina
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            //mientras espera haga lo siguiente
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // para controlar los errores
            return Center(
              child: Text('Error: ${snapshot.error}'), //muestra el error
            );
          } else {
            //----------------------------ahora despues de comprobar el future viene el crear la vista
            final List<ColmenaModel> colmenas = snapshot.data!;

            // final List<Datum> data = colmenas.data ?? [];
            // el snapshot es para obtener los datos del Future o stream el ! afirmando que no son nulos

            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 250,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 300,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.83, -0.56),
                              end: Alignment(-0.83, 0.56),
                              colors: [Color(0xFFF7A733), Color(0xFFFBD78C)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(180)),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            // SizedBox(
                            //   height: 100,
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(top: 48),
                              child: Row(children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(16.16),
                                    child: Text(
                                      'Hola $nombrePerfil',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                            Row(children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(16.16),
                                  child: Text(
                                    'Estas son tus colmenas',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    // es necesario para que se distribullan los elemento en la columna con esto le damos un tamaño definido

                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 8,
                        right: 8,
                        top: 16,
                      ),
                      child: SizedBox(
                        height: 450,
                        width: 400,
                        child: GridView.builder(
                          //el list...builder ya tiene SingleChildScrollView

                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 1),

                          itemCount: colmenas.length,
                          itemBuilder: (context, index) {
                            // print({'ENTRANDO HASTA AQUI':colmenas});
                            return CardsColmenas(colmenas[index]);
                            // title: Text(colmenas[index].nombre),
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ColmenasService().postData().then((_) {
            setState(() {});
          }).catchError((error) {
            print('Error: $error');
          });
        },
        tooltip: 'Agregar Colmena',
        child: Icon(Icons.add),
      ),
    );
  }
}
//  ColmenasService().postData();
