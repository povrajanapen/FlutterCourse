import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Center(
      child: Column(
        children: [
          CustomCard(text:"OOP", color:Colors.pink[100]),
          CustomCard(text:"DART", color:Colors.pink[300]),
          CustomCard(text:"FLUTTER", color:Colors.pink[600]),
        ],
      ),
    ),
  ),);
}

class CustomCard extends StatelessWidget {
  const CustomCard({required this.text,required this.color,super.key});
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Center(
      child: Column(
        children:[

          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: color,
            ),
            child: Center(
              child: Text(
              text,
              style: const TextStyle(
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
  );
  }
}