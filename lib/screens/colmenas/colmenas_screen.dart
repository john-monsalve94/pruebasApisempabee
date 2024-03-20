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
  @override
  Widget build(BuildContext context) {
    Future<List<ColmenaModel>> hey;
    Future<PerfilModel> loco;
    return AppBarEmpa(
      
      body: FutureBuilder<List<dynamic>>(
        future: Future.wait([
          hey = ColmenasService().getColmenas(8, 1),
          loco = PerfilService.getPerfil(),
        ]),

        builder: (context, snapshot) { 
          print('heyyyyyyyyyyyyyyyyyyyyyyyyy');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final List<dynamic> data = snapshot.data ?? [];
          final List<ColmenaModel> colmenas = data[0] as List<ColmenaModel>;
          print(colmenas);
          final PerfilModel perfil = data[1] as PerfilModel;
          print(perfil);
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
                                    'Hola ${perfil.primerNombre} ${perfil.segundoNombre}',
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

                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
  // @override
  // Widget build(BuildContext context) {
  //   return AppBarEmpa(

  //     body: FutureBuilder<List<ColmenaModel>>(
  //       future: ColmenasService().getColmenas(8,
  //           1), // para manejar el nummero  de colmenas que voy a mostrar en la pagina
  //       initialData: const [],
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           //mientras espera haga lo siguiente
  //           return Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         } else if (snapshot.hasError) {
  //           // para controlar los errores
  //           return Center(
  //             child: Text('Error: ${snapshot.error}'), //muestra el error
  //           );
  //         } else {
  //           //----------------------------ahora despues de comprobar el future viene el crear la vista
  //           final List<ColmenaModel> colmenas = snapshot.data!;

  //           // final List<Datum> data = colmenas.data ?? [];
  //           // el snapshot es para obtener los datos del Future o stream el ! afirmando que no son nulos

  //           return Center(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 SizedBox(
  //                   height: 250,
  //                   child: Stack(
  //                     children: [
  //                       Container(
  //                         width: double.infinity,
  //                         height: 300,
  //                         decoration: ShapeDecoration(
  //                           gradient: LinearGradient(
  //                             begin: Alignment(0.83, -0.56),
  //                             end: Alignment(-0.83, 0.56),
  //                             colors: [Color(0xFFF7A733), Color(0xFFFBD78C)],
  //                           ),
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.only(
  //                                 bottomRight: Radius.circular(180)),
  //                           ),
  //                         ),
  //                       ),
  //                       Column(
  //                         children: [
  //                           // SizedBox(
  //                           //   height: 100,
  //                           // ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(top: 48),
  //                             child: Row(children: [
  //                               Expanded(
  //                                 child: Padding(
  //                                   padding: EdgeInsets.all(16.16),
  //                                   child: Text(
  //                                     'Hola ${perfilService.}',
  //                                     style: TextStyle(
  //                                         fontSize: 24,
  //                                         fontWeight: FontWeight.bold),
  //                                   ),
  //                                 ),
  //                               ),
  //                             ]),
  //                           ),
  //                           Row(children: [
  //                             Expanded(
  //                               child: Padding(
  //                                 padding: EdgeInsets.all(16.16),
  //                                 child: Text(
  //                                   'Estas son tus colmenas',
  //                                   style: TextStyle(
  //                                       fontSize: 20,
  //                                       fontWeight: FontWeight.bold),
  //                                 ),
  //                               ),
  //                             ),
  //                           ]),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 Expanded(
  //                   // es necesario para que se distribullan los elemento en la columna con esto le damos un tamaño definido

  //                   child: Padding(
  //                     padding: EdgeInsets.only(
  //                       left: 8,
  //                       right: 8,
  //                       top: 16,
  //                     ),
  //                     child: SizedBox(
  //                       height: 450,
  //                       width: 400,
  //                       child: GridView.builder(
  //                         //el list...builder ya tiene SingleChildScrollView

  //                         gridDelegate:
  //                             SliverGridDelegateWithFixedCrossAxisCount(
  //                                 crossAxisCount: 2, childAspectRatio: 1),

  //                         itemCount: colmenas.length,
  //                         itemBuilder: (context, index) {
  //                           // print({'ENTRANDO HASTA AQUI':colmenas});
  //                           return CardsColmenas(colmenas[index]);
  //                           // title: Text(colmenas[index].nombre),
  //                         },
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           );
  //         }
  //       },
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: () {
  //         ColmenasService().postData().then((_) {
  //           setState(() {});
  //         }).catchError((error) {
  //           print('Error: $error');
  //         });
  //       },
  //       tooltip: 'Agregar Colmena',
  //       child: Icon(Icons.add),
  //     ),
  //   );
  // }
}
//  ColmenasService().postData();
