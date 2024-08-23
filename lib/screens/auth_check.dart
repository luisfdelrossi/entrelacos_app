import 'package:entrelacos_app/screens/home.dart';
import 'package:entrelacos_app/screens/login.dart';
import 'package:entrelacos_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    if (auth.isLoading) {
      return loading();
    } else if (auth.user == null) {
      return const LoginScreen();
    } else {
      return const HomeScreen();
    }
  }
}

loading() {
  return const Scaffold(body: Center(child: CircularProgressIndicator()));
}
