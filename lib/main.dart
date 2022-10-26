import 'package:flutter/material.dart';

import 'app/screens/HomePage.dart';

void main() {
  runApp(const RandomUsersApp());
}

class RandomUsersApp extends StatelessWidget {
  const RandomUsersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random_Users_App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
