// ignore_for_file: camel_case_types, file_names

import 'package:empabee/models/colmenas_models.dart';
import 'package:empabee/services/colmenas_services.dart';
import 'package:empabee/widgets/appBarEmpa.dart';
import 'package:flutter/material.dart';

class ColmenaEspe_screen extends StatefulWidget {
  final int id;
  final String nombre;

  const ColmenaEspe_screen({
    super.key,
    required this.id,
    required this.nombre,
  });

  @override
  State<ColmenaEspe_screen> createState() => _ColmenaEspe_screenState();
}

class _ColmenaEspe_screenState extends State<ColmenaEspe_screen> {
  List<String> list = <String>[
    'Filtrar',
    'Informes',
    'Advertencia',
    'Alertas',
  ];
  String dropdownValue = 'Filtrar';
  @override
  Widget build(BuildContext context) {
    return AppBarEmpa(
      titulo: widget.nombre,
      body: FutureBuilder(
        future: ColmenasService().getColmenaById(widget.id),
        builder: (BuildContext context, AsyncSnapshot<ColmenaModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // final colmena = snapshot.data!;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 48),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Acción al presionar el botón de Producción
                          },
                          child: Text('Producción'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Acción al presionar el botón de Estado
                          },
                          child: Text('Estado'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Acción al presionar el botón de Configuración
                          },
                          child: Text('Configuración'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Reportes'),
                      DropdownMenu<String>(
                        initialSelection: dropdownValue,
                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        dropdownMenuEntries:
                            list.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      )
                    ],
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
