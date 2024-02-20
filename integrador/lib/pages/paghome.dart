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
  final CollectionReference guincho = FirebaseFirestore.instance.collection('guincho');
  String rg='';
  bool cli = true;
  

  Future<void> pegaid() async {
    List<String> ids = [];
    List<String> guids = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('cliente').get();
    QuerySnapshot querySnapsh2 = await FirebaseFirestore.instance.collection('guincho').get();
    ids = querySnapshot.docs.map((doc) => doc.id).toList();
    guids = querySnapsh2.docs.map((doc) => doc.id).toList();

    for (var name in ids) {
      var documentSnapshot = await FirebaseFirestore.instance.collection('cliente').doc(name).get();
      if (documentSnapshot.data()!['uid'] == user.uid) {
        setState(() {
          rg = name;
          cli = true;
        });
        break;
      } 
    }
    for (var name in guids) {
      var documentSnapshot = await FirebaseFirestore.instance.collection('guincho').doc(name).get();
      if (documentSnapshot.data()!['uid'] == user.uid) {
        setState(() {
          rg = name;
          cli = false;
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
    if((rg!="")&&(cli==true)){
      await cliente.doc(rg).delete();
    }
    if((rg!="")&&(cli==false)){
      await guincho.doc(rg).delete();
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
                return Text('falha ao obter dados');
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
              if(cli==true){
                Navigator.pushNamed(context, '/pagtroca');
              }
              else{
                Navigator.pushNamed(context, '/pagchange');
              }
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