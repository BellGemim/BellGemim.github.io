import 'package:flutter/material.dart';

class Paglog extends StatefulWidget {
  const Paglog({super.key});

  @override
  State<Paglog> createState() => _PaglogState();
}

class _PaglogState extends State<Paglog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body : Center(
          child :Container(
            height: 420,
            width: 600,
            color: Colors.deepPurple[400],
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) => Container(
                width: 100,
                height: 60,
                color: Colors.deepPurple[300],
                margin: EdgeInsets.all(5),
              ),
            ),
        )
      ),
    );
  }
}