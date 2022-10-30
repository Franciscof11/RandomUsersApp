import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:usuarios/connectivity/connectivity_store.dart';
import 'package:usuarios/users/user_repository.dart';
import 'package:usuarios/users/users_api.dart';
import 'package:usuarios/users/users_store.dart';

import '../home/home_page.dart';

GetIt getIt = GetIt.I;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.openBox('users');
  getIt.registerSingleton(Client());
  getIt.registerFactory(() => UsersAPIList(getIt()));
  getIt.registerSingleton<ConnectivityStore>(ConnectivityStore());
  getIt.registerSingleton<UsersRepository>(UsersRepository(getIt()));
  getIt.registerSingleton<UsersStore>(UsersStore(getIt()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.grey,
      ),
      home: const HomePage(),
    );
  }
}
