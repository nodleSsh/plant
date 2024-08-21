import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant/components/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout(context) {
    FirebaseAuth.instance.signOut();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Container(
            
          ),
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
