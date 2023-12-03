import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:integrador/pages/paghome.dart';
import 'package:integrador/pages/paglogin.dart';

class Pagmain extends StatelessWidget {
  const Pagmain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return Paghome();
          }else{
            return Paglogin();
          }
        },
      )
    );
  }
}