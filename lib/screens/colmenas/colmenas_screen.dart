// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, library_private_types_in_public_api

import 'package:empabee/models/perfil_models.dart';
import 'package:empabee/services/perfil_service.dart';
import 'package:empabee/widgets/appBarEmpa.dart';

import 'package:empabee/widgets/cards_colmenas.dart';

import 'package:flutter/material.dart';
import 'package:empabee/screens/screens.dart';

class ColmenasScreen extends StatefulWidget {
  const ColmenasScreen({super.key});

  @override
  _ColmenasScreenState createState() => _ColmenasScreenState();
}

class _ColmenasScreenState extends State<ColmenasScreen> {
  @override
  Widget build(BuildContext context) {
    // print('ddddddddddddddddddddddddddd');
    return AppBarEmpa(
      titulo: 'Bienvenido a Empabeee',
      body: FutureBuilder<Map<String, dynamic>>(
        future: Future.wait([
          PerfilService.getPerfil(),
          ColmenasService().getColmenas(8, 1),
        ]).then((List<dynamic> data) {
          return {
            'perfil': data[0] as PerfilModel,
            'colmenas': data[1] as List<ColmenaModel>,
          };
        }),
        builder: (context, snapshot) {
          // print('heyyyyyyyyyyyyyyyyyyyyyyyyy');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final Map<String, dynamic> data = snapshot.data ?? {};
          final PerfilModel perfil = data['perfil'];
          final List<ColmenaModel> colmenas = data['colmenas'];
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
            // print('Error: $error');
          });
        },
        tooltip: 'Agregar Colmena',
        child: Icon(Icons.add),
      ),
    );
  }
}
