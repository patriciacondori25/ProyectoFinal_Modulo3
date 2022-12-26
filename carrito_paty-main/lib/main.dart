// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:carrito_paty/constantes.dart';
import 'package:carrito_paty/vista/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'modelo/carrito.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<carrito> listacarrito = [];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Computadoras',
      theme: ThemeData(
        primarySwatch: colorPrimario,
        //canvasColor: Colors.blueAccent,
      ),
      home: const login(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
