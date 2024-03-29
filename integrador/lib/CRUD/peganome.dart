import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Peganome extends StatelessWidget {

  final String id;

  Peganome({required this.id});

  @override
  Widget build(BuildContext context) {

    CollectionReference cliente = FirebaseFirestore.instance.collection('cliente');


    return FutureBuilder<DocumentSnapshot>(
      future: cliente.doc(id).get(),
      builder: ((context, snapshot) {
        Map<String,dynamic> info = snapshot.data!.data() as Map<String,dynamic>;
        return Text('nome : ${info['nome']}, placa : ${info['placa carro']} cidade : ${info['cidade']}');
    }), 
    );
  }
}