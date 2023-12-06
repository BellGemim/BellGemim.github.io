// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:integrador/pages/paghome.dart';
import 'package:integrador/pages/paglogin.dart';
import 'package:integrador/pages/pagmain.dart';
import 'package:integrador/pages/pagsingup.dart';

Future main() async{
 WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
    await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyDC1cckBjwDKEiFPNzTdOrPGL_4MLlcBg4", appId: "1:673412955638:web:1c0e13e46a0410048b5bd7", messagingSenderId:"673412955638", projectId: "integras-43a6d"));
  }

  Firebase.initializeApp();

  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : Pagmain(),
      routes: {
        '/paghome' :(context) => Paghome(),
        '/pagmain' :(context) => Pagmain(),
        '/paglogin' :(context) => Paglogin(),
        '/pagsign' :(context) => Pagsingup(),
      },
    );
  }
}
