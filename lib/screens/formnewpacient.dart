import 'package:entrelacos_app/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';



class Formsnewpacient extends StatefulWidget {
  const Formsnewpacient({super.key});

  @override
  State<Formsnewpacient> createState() => _FormsnewpacientState();
}

class _FormsnewpacientState extends State<Formsnewpacient> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  DateTime _datetimeController = DateTime.now();
  bool varRecorrente = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Paletacores.color7,
        appBar: AppBar(
          title: const Text("Agendar Novo Paciente"),
          toolbarHeight: 70,
          backgroundColor: Paletacores.color6,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 24),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: _nameController,
                      cursorColor: Colors.black,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          label: Text("Nome do Paciente",
                              style: TextStyle(color: Colors.black)),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.person),
                          ),
                          prefixIconColor: Colors.black),
                          validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o Nome';
                      }
                      return null;
                      }
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      PhoneNumberInputFormatter(),
                    ],
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text("Celular",
                            style: TextStyle(color: Colors.black)),
                        hintText: '(xx) 9xxxx-xxxx',
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.phone),
                        ),
                        prefixIconColor: Colors.black),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o telefone';
                      }
                      if (value.length != 15 || value[5] != '9') {
                        return 'Número de celular inválido';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: DateTimePicker(  onDateTimeChanged: (selectedDate) {
                  setState(() {
                    _datetimeController = selectedDate;
                  });
                },), /* TextFormField(
                    readOnly: true,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Clicou')),
                      );
                    },
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text("Data e Hora",
                            style: TextStyle(color: Colors.black)),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.calendar_month),
                        ),
                        prefixIconColor: Colors.black),
                  ), */
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recorrente",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Switch(
                          value: varRecorrente,
                          onChanged: (value) => {
                          setState(() {
                            varRecorrente = value;
                            debugPrint("$varRecorrente");
                          })
                              })
                    ],
                  )),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                          if (_datetimeController.isBefore(DateTime.now())) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Data/hora inválidas. Selecionar uma data futura.'),
                                ),
                              );
                              return; // Impede a continuação do código caso a data seja inválida
                            }
                    final String namePatient = _nameController.text;
                    final String phoneNumber = _phoneController.text;
                    final String selectedDatetext = DateFormat('dd/MM/yyyy HH:mm').format(_datetimeController).toString();
                    final String recorrenteText = varRecorrente ? "Sim" : "Não";

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Atendimento Agendado com Sucesso!\nNome: $namePatient\nCelular: $phoneNumber\nData e Hora: $selectedDatetext\nRecorrente: $recorrenteText'),
                      ));
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Paletacores.color6),
                    minimumSize: MaterialStateProperty.all(const Size(200, 40)),
                  ),
                  child: const Text(
                    "Salvar e Agendar",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )),

            /*  
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Paletacores.color6),
                      minimumSize:
                          MaterialStateProperty.all(const Size(200, 40)),
                    ),
                    child: const Text(
                      "Completar Cadastro",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )),
              ),*/

              
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Verifica o tamanho máximo de 11 dígitos
    if (digitsOnly.length > 11) {
      digitsOnly = digitsOnly.substring(0, 11);
    }

    String formattedText = '';

    if (digitsOnly.isNotEmpty) {
      formattedText = '(${digitsOnly.substring(0, min(2, digitsOnly.length))}';
    }

    if (digitsOnly.length > 2) {
      formattedText +=
          ') ${digitsOnly.substring(2, min(3, digitsOnly.length))}';
    }

    if (digitsOnly.length > 3) {
      formattedText += digitsOnly.substring(3, min(7, digitsOnly.length));
    }

    if (digitsOnly.length > 7) {
      formattedText += '-${digitsOnly.substring(7, digitsOnly.length)}';
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  int min(int a, int b) {
    return a < b ? a : b;
  }
}


class DateTimePicker extends StatefulWidget {
  final ValueChanged<DateTime> onDateTimeChanged;

  const DateTimePicker({super.key, required this.onDateTimeChanged}); 
  @override
  _DateTimePickerState createState() => _DateTimePickerState();

  }

class _DateTimePickerState extends State<DateTimePicker> {
  final _datecontroller = TextEditingController();
  DateTime _selectedDateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _datecontroller.text = DateFormat('dd/MM/yyyy HH:mm').format(_selectedDateTime);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _datecontroller,
      readOnly: true,
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: _selectedDateTime,
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );

        if (pickedDate != null) {
          final TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
          );

          if (pickedTime != null) {
            setState(() {
              _selectedDateTime = DateTime(
                pickedDate.year,
                pickedDate.month,
                pickedDate.day,
                pickedTime.hour,
                pickedTime.minute,
              );
              _datecontroller.text = DateFormat('dd/MM/yyyy HH:mm').format(_selectedDateTime);
              widget.onDateTimeChanged(_selectedDateTime);
            });
          }
        }
      },
        cursorColor: Colors.black,
        style: const TextStyle(color: Colors.black),
        decoration: const InputDecoration(
            border: InputBorder.none,
            label: Text("Data e Hora",
                style: TextStyle(color: Colors.black)),
            prefixIcon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.calendar_month),
            ),
            prefixIconColor: Colors.black),
    );
  }
}

