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
  final CollectionReference cliente = FirebaseFirestore.instance.collection('cliente');
  String rg='';

  Future<void> pegaid() async {
    List<String> ids = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('cliente').get();
    ids = querySnapshot.docs.map((doc) => doc.id).toList();

    for (var name in ids) {
      var documentSnapshot = await FirebaseFirestore.instance.collection('cliente').doc(name).get();
      if (documentSnapshot.data()!['uid'] == user.uid) {
        setState(() {
          rg = name;
        });
        break;
      } 
    }
  }

  Future<void> iniRg() async {
      await pegaid();
  }

  Future<void> deleta() async {
    await user.delete();
    if(rg!=""){
      await cliente.doc(rg).delete();
    }
    Navigator.pushNamed(context, '/paglogin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Column(
        children: [
          FutureBuilder(
            future: iniRg(),
            builder: (context, snapshot) { 
              if (rg!=''){
                return Peganome(id: rg);
              }
              else{
                return Text('minha buceta');
              }
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

          GestureDetector(
            onTap: (){
            Navigator.pushNamed(context, '/pagtroca');
          },
            child : Container(
              color: Colors.amber,
              child:Text(
                "Update",
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ),

          GestureDetector(
            onTap: (){
            deleta();
          },
            child : Container(
              color: Colors.amber,
              child:Text(
                "deleta",
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ),

        ],
      ))
    );
  }
}