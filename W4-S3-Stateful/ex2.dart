import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.pink[50],
          title: const Text(
            "Favorite cards",
            style: TextStyle(
              color: Colors.pink,
              fontWeight: FontWeight.bold,
            ),
          ),
            centerTitle: false,
        ),
        body: const Column(
          children: [
            FavoriteCard(isFavorite: true),
            FavoriteCard(isFavorite: false),
            FavoriteCard(isFavorite: true),
          ],
        ),
      ),
    ));

class FavoriteCard extends StatefulWidget {
  final bool isFavorite;
  const FavoriteCard({
    super.key, required this.isFavorite,
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {

@override 
void initState(){
  super.initState();
  isFavorite = widget.isFavorite;

}

late bool isFavorite;
//allows isFavorite to be initialized in initState()
void favorite(){
  setState(() {
    isFavorite = !isFavorite;
  });
}
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.50, color: Colors.pink),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Row(
          children: [
             Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title',
                    style: TextStyle(
                      color: Colors.pink[200],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],       
            ),
            ),
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.pink : Colors.grey,
            ),

            onPressed: favorite,
            )
          ],
        ),
        );
  }
}
 