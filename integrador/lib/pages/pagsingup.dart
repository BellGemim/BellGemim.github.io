import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Pagsingup extends StatefulWidget {
  const Pagsingup({super.key});

  @override
  State<Pagsingup> createState() => _PagssingupState();
}

class _PagssingupState extends State<Pagsingup> {

  @override
  
  final usuarioController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmaController = TextEditingController();
  final nomeController = TextEditingController();
  final placaController = TextEditingController();
  final cidadeController = TextEditingController();

  final CollectionReference cliente = FirebaseFirestore.instance.collection('cliente');

    Future criaCadastro() async {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: usuarioController.text.trim(),
      password: senhaController.text.trim());

      await cliente.add({
        'nome': nomeController.text.trim(),
        'placa carro': placaController.text.trim(),
        'cidade': cidadeController.text.trim(),
        'uid': FirebaseAuth.instance.currentUser!.uid,});
    }



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
                    controller: usuarioController ,
                    decoration: InputDecoration(hintText: "Email"),
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
                    controller: senhaController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Senha"),
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
                    controller: confirmaController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Confirmar Senha"),
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
                    if (senhaController.text.trim() == confirmaController.text.trim()){
                      criaCadastro();
                      Navigator.pushNamed(context, '/pagmain');
                    }
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
                        "Criar Conta",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ), 
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/paglogin');
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
                        "Ja Tenho Conta",
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