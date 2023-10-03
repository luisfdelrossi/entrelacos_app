import 'package:entrelacos_app/assets.dart';
import 'package:flutter/material.dart';

class formsnewpacient extends StatefulWidget {
  const formsnewpacient({super.key});
  
  @override
  State<formsnewpacient> createState() => _formsnewpacientState();
}

class _formsnewpacientState extends State<formsnewpacient> {
  bool varRecorrente = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Paletacores.color7,
      appBar: AppBar(
        title: Text("Agendar Novo Paciente"),
        toolbarHeight: 70,
        backgroundColor: Paletacores.color6,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 24),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                 child: TextFormField(
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(border: InputBorder.none,
                      label: Text("Nome do Paciente", style: TextStyle(color: Colors.black)),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.person),
                      ),
                      prefixIconColor: Colors.black),
                ),
                
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
               child: TextFormField(
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(border: InputBorder.none,
                    label: Text("Celular", style: TextStyle(color: Colors.black)),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.phone),
                    ),
                    prefixIconColor: Colors.black),
              ),
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
               child: TextFormField(
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(border: InputBorder.none,
                    label: Text("Data e Hora", style: TextStyle(color: Colors.black)),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.calendar_month),
                    ),
                    prefixIconColor: Colors.black),
              ),
              
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("Recorrente", style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),),
              Switch(value: varRecorrente, onChanged: (varRecorrente) => {
              varRecorrente = !varRecorrente, 
              debugPrint("$varRecorrente")}
              )
            ],)
          ),
          ElevatedButton(onPressed: null, child: Text("Salvar e Agendar", style: TextStyle(color: Colors.black, fontSize: 16),), 
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Paletacores.color6),
            minimumSize: MaterialStateProperty.all(Size(200, 40)),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:8.0),
            child: ElevatedButton(onPressed: null, child: Text("Completar Cadastro", style: TextStyle(color: Colors.black, fontSize: 16),), 
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Paletacores.color6),
              minimumSize: MaterialStateProperty.all(Size(200, 40)),
            )),
          ),
          
        ],
      ),
    );
  }
}
