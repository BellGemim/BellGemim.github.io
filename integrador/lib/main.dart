// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:integrador/pages/paglogin.dart';
import 'package:integrador/pages/pagmain.dart';
import 'package:integrador/pages/pagsingup.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : Paglogin(),
      routes: {
        '/pagmain' :(context) => Pagmain(),
        '/paglogin' :(context) => Paglogin(),
        '/pagsign' :(context) => Pagsingup(),
      },
    );
  }
}
