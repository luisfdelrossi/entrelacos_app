import 'package:entrelacos_app/assets.dart';
import 'package:flutter/material.dart';

class Formsnewpacient extends StatefulWidget {
  const Formsnewpacient({super.key});
  
  @override
  State<Formsnewpacient> createState() => _FormsnewpacientState();
}

class _FormsnewpacientState extends State<Formsnewpacient> {
  bool varRecorrente = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Paletacores.color7,
      appBar: AppBar(
        title: const Text("Agendar Novo Paciente"),
        toolbarHeight: 70,
        backgroundColor: Paletacores.color6,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 24),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                 child: TextFormField(
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(border: InputBorder.none,
                      label: Text("Nome do Paciente", style: TextStyle(color: Colors.black)),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(8.0),
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
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(border: InputBorder.none,
                    label: Text("Celular", style: TextStyle(color: Colors.black)),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(8.0),
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
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(border: InputBorder.none,
                    label: Text("Data e Hora", style: TextStyle(color: Colors.black)),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.calendar_month),
                    ),
                    prefixIconColor: Colors.black),
              ),
              
            ),
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text("Recorrente", style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),),
              Switch(value: varRecorrente, onChanged: (varRecorrente) => {
              varRecorrente = !varRecorrente, 
              debugPrint("$varRecorrente")}
              )
            ],)
          ),
          ElevatedButton(onPressed: null, 
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Paletacores.color6),
            minimumSize: MaterialStateProperty.all(const Size(200, 40)),
          ), child: const Text("Salvar e Agendar", style: TextStyle(color: Colors.black, fontSize: 16),)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:8.0),
            child: ElevatedButton(onPressed: null, 
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Paletacores.color6),
              minimumSize: MaterialStateProperty.all(const Size(200, 40)),
            ), child: const Text("Completar Cadastro", style: TextStyle(color: Colors.black, fontSize: 16),)),
          ),
          
        ],
      ),
    );
  }
}
