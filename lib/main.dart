// ignore: unused_import
import 'package:entrelacos_app/screens/formnewpacient.dart';
import 'package:entrelacos_app/screens/home.dart';
import 'package:entrelacos_app/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';


/*import 'package:appwrite/appwrite.dart';

Client client = Client();
client  
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('64ffac5b31f83b61e953')
    .setSelfSigned(status: true);
*/

main() {
  //runApp(const MyApp());
  //runApp(MaterialApp(home: const LoginScreen()));
  //runApp(MaterialApp(home: const HomeScreen()));
  runApp(MaterialApp(home: const formsnewpacient()));
  /*await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );  */
  
}

