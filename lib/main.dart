import 'package:flutter/material.dart';
import 'package:plant/pages/login_page.dart';
import 'package:plant/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      routes: {
        '/register_page':(context) => const RegisterPage(),
      },
    );
  }
}