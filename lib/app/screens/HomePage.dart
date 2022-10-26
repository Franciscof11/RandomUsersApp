import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Random Users App")),
      ),
      body: const Center(
        child: Text("Home Page"),
      ),
    );
  }

  Future<List<User>> getUser() async {}
}
