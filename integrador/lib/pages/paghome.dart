// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:integrador/CRUD/peganome.dart';

class Paghome extends StatefulWidget {
  const Paghome({super.key});

  @override
  State<Paghome> createState() => _PaghomeState();
}

class _PaghomeState extends State<Paghome> {

  final user = FirebaseAuth.instance.currentUser!;

  List <String> ids = [];
  late String rg;

  Future pegaid() async {
    await FirebaseFirestore.instance.collection('cliente').get().then(
      (snapshot) => snapshot.docs.forEach((documento) { 
          ids.add(documento.reference.id);
      })
    );
    for (var name in ids) {
      var documentSnapshot = await FirebaseFirestore.instance.collection('cliente').doc(name).get();
      if (documentSnapshot.data()!['uid'] == user.uid) {
        rg = name; 
        break;
      }
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Column(
        children: [
          FutureBuilder(
            future: pegaid(),
            builder: (context, snapshot) { 
              return Peganome(id: rg);
              },
             ),

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