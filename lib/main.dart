import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plant/auth/auth_page.dart';
import 'package:plant/auth/login_or_register.dart';
import 'package:plant/firebase_options.dart';
import 'package:plant/pages/home_page.dart';
import 'package:plant/pages/login_page.dart';
import 'package:plant/pages/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      routes: {
        '/register_page': (context) => const RegisterPage(),
        '/home_page':(context) => const HomePage(),
      },
    );
  }
}
