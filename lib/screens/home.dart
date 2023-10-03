
import 'package:entrelacos_app/assets.dart';
import 'package:entrelacos_app/domain/models/appointment.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String user = "NomeUser";
  final String nivelacesso = "NivelAcesso";
  late final List dates;
  late final DateFormat weekDayFormat;
  final List horarioslist = ["Nome", "09:00", "Sala Carla"];

  @override
  void initState() {
    DateTime now = DateTime.now();
    dates = List.generate(7, (index) => DateTime(now.year, now.month, now.day + index));
    initializeDateFormatting("pt_BR");
    weekDayFormat = DateFormat("EEEE - dd/MM/yyyy","pt_BR");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(dates.toString());
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
                children: dates.map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DataList(date: weekDayFormat.format(e), horario: horarioslist,),
                )).toList(),
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

class DataList extends StatelessWidget {
  const DataList({
    super.key, 
    required this.date,
    required this.horario,
  });
  final String date;
  final List<Appointment> horario;
 


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "$date",
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
