// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:empabee/models/colmenas_models.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CardsColmenas extends StatelessWidget {
  final ColmenaModel card;

  const CardsColmenas(this.card, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // switch (card.estado) {
    //   case 'Info':
    //     Color color = Colors.green;
    //     break;
    //   case 'Info':
    //     Color color = Colors.green;
    //     break;
    //   default:
    // }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 219, 139, 35).withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(5, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          // color: const Color.fromARGB(255, 185, 50, 50),
        ),
        child: CardOnPressColmena(
            card: card,
            onTap: () {
              print(card);
              context.go('/colmenas/colmenaEspecifica/${card.id}');
              // context.goNamed('/colmenaEspecifica',
              //     pathParameters: {'colmena_id': '${card.id}'});
            }),
      ),
    );
  }
}

class CardOnPressColmena extends StatelessWidget {
  final GestureTapCallback? onTap;
  const CardOnPressColmena({
    super.key,
    this.onTap,
    required this.card,
  });

  final ColmenaModel card;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation:
            0, // Establece la elevación del Card a 0 para evitar sombra duplicada
        shadowColor: Color(0xFFF7A733),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.orange,
                child: SvgPicture.asset(
                  'assets/images/colmena.svg', // Ruta al archivo SVG en tu proyecto

                  width: 40,
                  height: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(card.nombre),
              ),
              Text('Último valor importante'),
            ],
          ),
        ),
      ),
    );
  }
}
