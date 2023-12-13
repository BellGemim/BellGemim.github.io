// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Paghome extends StatefulWidget {
  const Paghome({super.key});

  @override
  State<Paghome> createState() => _PaghomeState();
}

class _PaghomeState extends State<Paghome> {

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Column(
        children: [
          Text("fez login com " + user.email!),

          GestureDetector(
            onTap: (){
            FirebaseAuth.instance.signOut();
          },
          child : Container(
            color: Colors.amber,
            child:Text(
              "deslogar",
              style: TextStyle(color: Colors.black87),
            ),
          ),

          ),
        ],
      ))
    );
  }
}