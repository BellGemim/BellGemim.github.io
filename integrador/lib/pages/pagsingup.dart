import 'package:flutter/material.dart';

class Pagsingup extends StatelessWidget {
  const Pagsingup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body : Center(
        child :Container(
          height: 420,
          width: 600,
          color: Colors.deepOrange[400],
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/pagmain');
                },
              child: Container(
                height: 210,
                width: 300,
                color: Colors.deepOrange[200],
                
              ),
            ),
          ),
        ),
      ),
    );
  }
}