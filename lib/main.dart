import 'package:entrelacos_app/screens/auth_check.dart';
import 'package:entrelacos_app/services/auth_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

/*import 'package:appwrite/appwrite.dart';

Client client = Client();
client  
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('64ffac5b31f83b61e953')
    .setSelfSigned(status: true);
*/

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthService())],
      child: const MaterialApp(home: AuthCheck())));
      //child:(const MyApp());
      //child:(MaterialApp(home: const HomeScreen()));
      //child:(MaterialApp(home: const formsnewpacient()));
}
