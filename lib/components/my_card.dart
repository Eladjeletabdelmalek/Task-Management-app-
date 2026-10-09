import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String title;
  const MyCard({super.key, required this.title});


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.cyan,
      child:  SizedBox(
        width: 80,
        height: 80,
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}