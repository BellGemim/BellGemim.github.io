import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Pagtroca extends StatefulWidget {
  const Pagtroca({super.key});

  @override
  State<Pagtroca> createState() => _PagtrocaState();
}

class _PagtrocaState extends State<Pagtroca> {

  final nomeController = TextEditingController();
  final placaController = TextEditingController();
  final cidadeController = TextEditingController();

  final CollectionReference cliente = FirebaseFirestore.instance.collection('cliente');

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

    void trocainfo() async {
      if(nomeController.text.trim() != ""){
        await cliente.doc(rg).update({
          'nome': nomeController.text.trim(),
        });
      }
      if(placaController.text.trim() != ""){
        await cliente.doc(rg).update({
          'placa carro': placaController.text.trim(),
        });
      }
      if(cidadeController.text.trim() != ""){
        await cliente.doc(rg).update({
          'cidade': cidadeController.text.trim(),
        });
      }
    }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.deepPurple,
        body : Center(
          child :Container(
            height: 502,
            width: 600,
            color: Colors.deepPurple[400],
            child: ListView(
              
              children: [
                
                Container(
                  width: 100,
                  height: 53,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.deepPurple[300],
                    ),
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    controller: nomeController,
                    decoration: InputDecoration(hintText: "Nome"),
                    ),
                ),
                
                Container(
                  width: 100,
                  height: 53,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.deepPurple[300],
                    ),
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    controller: placaController,
                    decoration: InputDecoration(hintText: "Placa"),
                    ),
                ),

                Container(
                  width: 100,
                  height: 53,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.deepPurple[300],
                    ),
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    controller: cidadeController,
                    decoration: InputDecoration(hintText: "Cidade (tudo minusculo)"),
                    ),
                ),
                

                GestureDetector(
                  onTap: (){
                    pegaid();
                    trocainfo();
                    Navigator.pushNamed(context, '/pagmain');
                  },
                  child: Container(
                    width: 100,
                    height: 53,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.deepPurple[300],
                    ),
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        "Trocar",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ), 
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/pagmain');
                  },
                  child: Container(
                    width: 100,
                    height: 53,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.deepPurple[300],
                    ),
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        "Cancelar",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ), 
                  ),
                ),
              ],
            ),
        )
      ),
    );
  }
}