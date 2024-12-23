import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];
List<Widget> getLabels() {
  return colors.map((item)=> Text(item)).toList();
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10), 
        child: ListView(
          children: <Widget>[
            const Label("Method 1: Loop in Array", bold: true),
            for(var i = 0; i < colors.length; i++) Text(colors[i]),
            const Label("Method 2: Map", bold: true),
            ...colors.map((item) => Text(item)),
            const Label("Method 3: Dedicated Function", bold: true),
            ...getLabels(),
          ],
        ),
      ),
    ),
  ));
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
    );
  }
}
