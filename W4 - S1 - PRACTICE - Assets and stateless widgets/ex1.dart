import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             SizedBox(height: 40),
             Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: HobbyCard(title: 'Traveling', icon: Icons.travel_explore, color: Colors.green),
              ),
             SizedBox(height: 10),
             Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: HobbyCard(title: 'Skating', icon: Icons.skateboarding, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  const HobbyCard({
    required this.title,
    required this.icon,
    this.color=Colors.blue,
    super.key
  });

  final String title;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
       width: 250, 
       height: 80,
       decoration:  BoxDecoration(
         borderRadius: BorderRadius.circular(20),
         color:  color,
       ),
       
       child: Center(
         child: Row(
          
          children: [
           Padding(
             padding: const EdgeInsets.only(right: 20,left: 30),
             child: Icon(
               icon,
               color: Colors.white,
               size: 30.0,
             ),
           ),
           Text(
             title,
             style: const TextStyle(
               color: Colors.white,
               fontSize: 35,
               decoration: TextDecoration.none,
             ),
           ),
          ],
         ),
       ),
     );
  }
}
