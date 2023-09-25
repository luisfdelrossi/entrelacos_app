
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
  final List horarioslist = ["Nome", "09:00", "Sala Carla"];

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
                  datas("Hoje - 17/09", horarioslist),
                  datas("Amanhã - 18/09", horarioslist),
                  datas("Quarta - 19/09", horarioslist),
                  datas("Quinta - 20/09", horarioslist),
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

Widget datas(dia, List horario) {
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
                  horas(horario),
                  horas(horario),
                  horas(horario),
                  horas(horario),
                  horas(horario),
                  horas(horario),
                  horas(horario),
                  horas(horario),
                ],
              ),
            ),
          ),
          decoration: BoxDecoration(
              color: Paletacores.color2,
              borderRadius: BorderRadius.circular(10)),
          width: 300,
          height: 500,
        ),
      )
    ],
  );
}

Widget horas(List horarioslist) {
  return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.00),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text("${horarioslist[1]}", textAlign: TextAlign.start, 
              style: TextStyle(fontSize: 16.00)),
              Row(
                children: [
                  Text("${horarioslist[0]}", style: TextStyle(fontSize: 20.00, fontWeight: FontWeight.bold)),
                  Text(" - ${horarioslist[2]}", style: TextStyle(fontSize: 16.00)),
                ],
              ),
                ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(child: Container(child: Text("Ver Ficha", maxLines: 2, textAlign: TextAlign.center), width: 50,), onTap: () => {},),
            )
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
