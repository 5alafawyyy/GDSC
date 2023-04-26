import 'package:flutter/material.dart';
import 'screens/auth/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GDSC Login',
      theme: ThemeData(
        // fontFamily: "Pacifico",
        primarySwatch: Colors.blue,
      ),
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
      },
      initialRoute: LoginScreen.id,
    );
  }
}
