import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

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
    
    Future criaCadastro() async {
      if (senhaController.text.trim() == confirmaController.text.trim()){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usuarioController.text.trim(),
          password: senhaController.text.trim());
      }
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
                
                GestureDetector(
                  onTap: (){
                    criaCadastro();
                    Navigator.pushNamed(context, '/pagsign');
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
                        "Login",
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