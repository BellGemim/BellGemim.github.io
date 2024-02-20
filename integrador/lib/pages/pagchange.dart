import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Pagchange extends StatefulWidget {
  const Pagchange({super.key});

  @override
  State<Pagchange> createState() => _PagchangeState();
}

class _PagchangeState extends State<Pagchange> {

  final nomeController = TextEditingController();
  final placaController = TextEditingController();
  final cidadeController = TextEditingController();
  final precoController = TextEditingController();

  final CollectionReference guincho = FirebaseFirestore.instance.collection('guincho');

  final user = FirebaseAuth.instance.currentUser!;
  List <String> ids = [];
  String rg='';

  Future pegaid() async {
    await FirebaseFirestore.instance.collection('guincho').get().then(
      (snapshot) => snapshot.docs.forEach((documento) { 
          ids.add(documento.reference.id);
      })
    );
    for (var name in ids) {
      var documentSnapshot = await FirebaseFirestore.instance.collection('guincho').doc(name).get();
      if (documentSnapshot.data()!['uid'] == user.uid) {
        rg = name; 
        break;
      }
    }
  }

    void trocainfo() async {
      if(nomeController.text.trim() != ""){
        await guincho.doc(rg).update({
          'nome': nomeController.text.trim(),
        });
      }
      if(placaController.text.trim() != ""){
        await guincho.doc(rg).update({
          'placa': placaController.text.trim(),
        });
      }
      if(cidadeController.text.trim() != ""){
        await guincho.doc(rg).update({
          'cidade': cidadeController.text.trim(),
        });
      }
      if(precoController.text.trim() != ""){
        await guincho.doc(rg).update({
          'valor por kilometro': precoController.text.trim(),
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

                Container(
                  width: 100,
                  height: 53,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.deepPurple[300],
                    ),
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    controller: precoController,
                    decoration: InputDecoration(hintText: "preco por quilometro"),
                    ),
                ),
                

                GestureDetector(
                  onTap: ()async{
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