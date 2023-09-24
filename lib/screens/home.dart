import 'dart:ffi';

import 'package:entrelacos_app/assets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String user = "NomeUser";
  final String nivelacesso = "NivelAcesso";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            topbar(user, nivelacesso),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  datas("Hoje - 17/09", "Lista ou map de horas "),
                  datas("Amanhã - 18/09", "Lista ou map de horas "),
                  datas("Quarta - 19/09", "Lista ou map de horas "),
                  datas("Quinta - 20/09", "Lista ou map de horas "),
                ],
              ),
            ),
            TextButton(
              style: ButtonStyle(

                backgroundColor: MaterialStateColor.resolveWith((states) => Paletacores.color2),
              ),
                onPressed: null, child: Text("Agendar Novo Paciente", style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),))
          ],
        ));
  }
}

Widget datas(dia, horario) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            "$dia",
            maxLines: 1,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  horas("$horario"),
                  horas("$horario"),
                  horas("$horario"),
                  horas("$horario"),
                  horas("$horario"),
                  horas("$horario"),
                  horas("$horario"),
                  horas("$horario"),
                ],
              ),
            ),
          ),
          decoration: BoxDecoration(
              color: Paletacores.color2,
              borderRadius: BorderRadius.circular(8)),
          width: 300,
          height: 500,
        ),
      )
    ],
  );
}

Widget horas(horhorario) {
  return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.00),
      child: Container(
        child: Row(
          children: [
            Text("$horhorario"),
          ],
        ),
        decoration: BoxDecoration(
            color: Paletacores.color1,
            borderRadius: BorderRadius.circular(8.00)),
        height: 50,
      ),
    ),
  ]);
}

Widget topbar(user, nivelacesso) {
  return Container(
    color: Paletacores.fundo,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    color: Paletacores.color2,
                    Icons.circle,
                    size: 50,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Olá, ", style: TextStyle(fontSize: 24)),
                    Text(user,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
                Text(nivelacesso, style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                color: Paletacores.color2,
                Icons.menu,
                size: 50,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
