import 'package:flutter/material.dart';
import 'package:empabee/presentation/screens/screens.dart';


class ColmenasScreen extends StatefulWidget {
  @override
  _ColmenasScreenState createState() => _ColmenasScreenState();
}

class _ColmenasScreenState extends State<ColmenasScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Colmenas'),
      ),
      body: FutureBuilder<List<ColmenasModels>>(
        future: ColmenasService().getColmenas(),
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final List<ColmenasModels> colmenas = snapshot.data!;
            return ListView.builder(
              itemCount: colmenas.length,
              itemBuilder: (context, index) {
                print({'ENTRANDO HASTA AQUI':colmenas});
                return ListTile(
                  title: Text(colmenas[index].nombre),
                );
              },
            );
          }
        },
      ),
    );
  }
}
