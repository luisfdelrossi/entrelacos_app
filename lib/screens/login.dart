import 'package:entrelacos_app/assets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Paletacores.fundo,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(Images.logo),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
              child: TextFormField(decoration: const InputDecoration(label: Text("Login")),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
              child: TextFormField(
                
                decoration:const InputDecoration(label: Text("Senha"), suffixIcon: Icon(Icons.remove_red_eye_sharp),),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
              child: TextButton(onPressed:() {} ,style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) => Paletacores.color2),
                fixedSize: MaterialStateProperty.all(const Size(200.00, 40.00))), child: const Text("Confirmar",style: TextStyle(color: Colors.black)),),),
          ],
        ),
      ),
    );
  }
}
