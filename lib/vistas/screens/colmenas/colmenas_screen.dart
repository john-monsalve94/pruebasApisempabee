// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:empabee/widgets/appBarEmpabee.dart';
import 'package:empabee/widgets/cards_colmenas.dart';
import 'package:empabee/widgets/navFooterEmpabee.dart';

import 'package:flutter/material.dart';
import 'package:empabee/vistas/screens/screens.dart';

class ColmenasScreen extends StatefulWidget {
  @override
  _ColmenasScreenState createState() => _ColmenasScreenState();
}

class _ColmenasScreenState extends State<ColmenasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      extendBodyBehindAppBar: true,
      appBar: AppBarEmpabee(
        pageTitle: 'Bienvenido a Empabee',
      ),
      body: FutureBuilder<List<ColmenasModels>>(
        future: ColmenasService().getColmenas(),
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
            final List<ColmenasModels> colmenas = snapshot.data!;
            // el snapshot es para obtener los datos del Future o stream el ! afirmando que no son nulos

            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 300,
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
                            SizedBox(
                              height: 100,
                            ),
                            Row(children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(16.16),
                                  child: Text(
                                    'Hola John Monsalve',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ]),
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
                  SizedBox(height: 16,),
                  Expanded(
                    
                    // es necesario para que se distribullan los elemento en la columna con esto le damos un tamaño definido

                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: GridView.builder(
                        //el list...builder ya tiene SingleChildScrollView

                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.1),

                        itemCount: colmenas.length,
                        itemBuilder: (context, index) {
                          // print({'ENTRANDO HASTA AQUI':colmenas});
                          return CardsColmenas(colmenas[
                              index]); // title: Text(colmenas[index].nombre),
                        },
                      ),
                    ),
                  ),
                
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        
      },child: Icon(Icons.add),),
      bottomNavigationBar: NavFooter(),
    );
  }
}
