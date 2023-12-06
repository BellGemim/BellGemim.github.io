import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Paglogin extends StatefulWidget {
  const Paglogin({super.key});

  @override
  State<Paglogin> createState() => _PagloginState();
}

class _PagloginState extends State<Paglogin> {

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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.deepPurple[300],
                  ),
                  width: 100,
                  height: 60,
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.deepPurple[300],
                  ),
                  width: 100,
                  height: 60,
                  margin: EdgeInsets.all(5),
                  child: TextField(controller: usuarioController ,),
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.deepPurple[300],
                  ),
                  width: 100,
                  height: 60,
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.deepPurple[300],
                  ),
                  width: 100,
                  height: 60,
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.deepPurple[300],
                    ),
                    width: 100,
                    height: 60,
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.deepPurple[300],
                    ),
                    width: 100,
                    height: 60,
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