import 'package:flutter/material.dart';

class Pagmain extends StatelessWidget {
  const Pagmain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body : Center(
        child :Container(
          height: 420,
          width: 600,
          color: Colors.deepPurple[400],
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/pagsign');
              },
              child: Container(
                height: 210,
                width: 300,
                color: Colors.deepPurple[200],
              ),
            ),
          ),
        ),
      ),
    );
  }
}