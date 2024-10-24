import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Center(
      child: Column(
        children:[
//oop
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.blue[100],
            ),
            child: const Center(
              child: Text(
              'OOP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                decoration: TextDecoration.none,
              ),
              ),
            ),
          ), 
//dart
           Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.blue[300],
            ),
            child: const Center(
              child: Text(
              'DART',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                decoration: TextDecoration.none,
              ),
              ),
            ),
          ), 
//flutter
           Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              gradient: const LinearGradient(
                colors: [Color(0xff4E7DF5), Color(0xff083ABA)])),
                child: const Center(
              child: Text(
              'FLUTTER',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                decoration: TextDecoration.none,
              ),
              ),
            ),
            ), 
        ],
      ),
    )
  ));
}
