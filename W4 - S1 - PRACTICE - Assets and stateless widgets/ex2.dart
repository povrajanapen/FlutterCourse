import 'package:flutter/material.dart';

enum Product{
  dart,flutter,firebase;

  String get title{
    switch(this){
      case Product.dart:
      return "Dart";
      case Product.flutter:
      return "Flutter";
      case Product.firebase:
      return "Firebase";
    }
  }

  String get description{
    switch(this){
      case Product.dart:
      return "The best object language";
      case Product.flutter:
      return "The best mobile widget library";
      case Product.firebase:
      return "The best cloud database";
    }
  }

  String get image{
    switch(this){
      case Product.dart:
      return cardImage;
      case Product.flutter:
      return cardImage1;
      case Product.firebase:
      return cardImage2;
    }
  }

}
const String cardImage = 'assets/ProductCard-image/dart.png';
const String cardImage1 = 'assets/ProductCard-image/flutter.png';
const String cardImage2 = 'assets/ProductCard-image/firebase.png';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text('Products'),
          centerTitle: false,
        ),
        body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProductCard(product: Product.dart),
            ProductCard(product: Product.flutter),
            ProductCard(product: Product.firebase),
          ],
        ),
      ),
      ),

  ));
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    super.key,
  });

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              product.image,
              height: 80,
              width: 80,
            ),
            const SizedBox(height: 5,),
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 35,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
    ),
               );
  }
}
