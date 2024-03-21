// ignore_for_file: prefer_const_declarations

import 'package:empabee/models/perfil_models.dart';
import 'package:empabee/services/perfil_service.dart';
import 'package:empabee/widgets/drawerNav.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('perfil'),
      ),
      body: PerfilView(),
    );
  }
}

class PerfilView extends StatelessWidget {
  PerfilView({super.key});
  final PerfilService perfilService = PerfilService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PerfilModel>(
        future: PerfilService.getPerfil(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
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
            final PerfilModel perfilModel = snapshot.data!;
            final imageInternet =
                'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/e40b6ea6361a1abe28f32e7910f63b66/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg';
            // final List<Datum> data = colmenas.data ?? [];
            // el snapshot es para obtener los datos del Future o stream el ! afirmando que no son nulos

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(imageInternet),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(height: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${perfilModel.primerNombre} ${perfilModel.segundoApellido}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Teléfono: ${perfilModel.telefono}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Cédula: ${perfilModel.numeroIdentificacion}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Correo electrónico: ${perfilModel.email}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
