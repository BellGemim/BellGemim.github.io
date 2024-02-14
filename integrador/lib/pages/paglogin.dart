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

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () { },
    );

    AlertDialog alerta = AlertDialog(
      title: Text("Erro"),
      content: Text("conta errada / inexistente."),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.deepPurple,
        body : Center(
          child :Container(
            height: 300,
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
                  child: TextField(controller: usuarioController ,
                  decoration: InputDecoration(hintText: "Email"),),
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
                    decoration: InputDecoration(hintText: "senha"),
                    ),
                ),
                
                GestureDetector(
                  onTap: (){
                    checaCadastro();
                    Navigator.pushNamed(context, '/pagmain');
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