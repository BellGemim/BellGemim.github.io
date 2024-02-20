import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Pagchoice extends StatefulWidget {
  const Pagchoice({super.key});

  @override
  State<Pagchoice> createState() => _PagchoiceState();
}

class _PagchoiceState extends State<Pagchoice> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.deepPurple,
        body : Center(
          child :Container(
            height: 300,
            width: 600,
            color: Colors.deepPurple[400],
            child: Row(
              
              children: [

                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/pagsign');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.deepPurple[300],
                    ),
                    width: 250,
                    height: 60,
                    margin: EdgeInsets.all(5),
                    child: Text('criar conta cliente')
                  ),
                ),


                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/pagguincho');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.deepPurple[300],
                    ),
                    width: 250,
                    height: 60,
                    margin: EdgeInsets.all(5),
                    child:Text('criar conta guincho'),
                  ),
                ),
                

              ],
            ),
        )
      ),
    );
  }
}