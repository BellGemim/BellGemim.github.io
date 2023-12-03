import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Paglogin extends StatefulWidget {
  const Paglogin({super.key});

  @override
  State<Paglogin> createState() => _PagloginState();
}

class _PagloginState extends State<Paglogin> {

  @override
  final usuarioController = TextEditingController();
  final senhaController = TextEditingController();

  Future checaCadastro() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: usuarioController.text.trim(),
      password: senhaController.text.trim());
    }
    

  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.deepPurple,
        body : Center(
          child :Container(
            height: 420,
            width: 600,
            color: Colors.deepPurple[400],
            child: ListView(
              
              children: [

                Container(
                  width: 100,
                  height: 60,
                  color: Colors.deepPurple[300],
                  margin: EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      "Email:",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                      ),
                  ),
                ),

                Container(
                  width: 100,
                  height: 60,
                  color: Colors.deepPurple[300],
                  margin: EdgeInsets.all(5),
                  child: TextField(controller: usuarioController ,),
                ),

                Container(
                  width: 100,
                  height: 60,
                  color: Colors.deepPurple[300],
                  margin: EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      "Senha :",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ), 
                ),

                Container(
                  width: 100,
                  height: 60,
                  color: Colors.deepPurple[300],
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    controller: senhaController,
                    obscureText: true,
                    ),
                ),
                
                GestureDetector(
                  onTap: (){
                    checaCadastro();
                  },
                  child: Container(
                    width: 100,
                    height: 60,
                    color: Colors.deepPurple[300],
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ), 
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/pagsign');
                  },
                  child: Container(
                    width: 100,
                    height: 60,
                    color: Colors.deepPurple[300],
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

              ],
            ),
        )
      ),
    );
  }
}