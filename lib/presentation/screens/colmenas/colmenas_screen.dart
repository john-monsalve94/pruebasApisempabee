import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class ColmenasScreen extends StatelessWidget {
  const ColmenasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colmenas'),
      ),
      body: _ColmenasView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ColmenasView extends StatelessWidget {
  const _ColmenasView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('boton elevado')),
            ElevatedButton(
                onPressed: null, child: const Text('boton desabilitado')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.ac_unit_outlined),
                label: Text('boton con icono')),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'hola mundo',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
