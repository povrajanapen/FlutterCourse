import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

void main() => runApp(const MaterialApp( 
      debugShowCheckedModeBanner: false, // to hide debug banner on top right corner
      home: ImageGallery(), 
    )); 

class ImageGallery extends StatefulWidget {
  const ImageGallery({
    super.key,
  });

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  List<String> images = [ 
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
  ]; 
  int currentImage = 0;

  void imageChanged(int delta){
    setState(() {
      currentImage = (currentImage + delta)%images.length;
      if(currentImage < 0) currentImage = images.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            backgroundColor: Colors.purple[50],
            appBar: AppBar(
              backgroundColor: Colors.purple[400],
              title: const Text('Image viewer', style: TextStyle(color: Colors.white),),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.navigate_before, color: Colors.white),
                  tooltip: 'Go to the previous image',
                  onPressed: (){
                      imageChanged(-1);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: IconButton(
                    icon: const Icon(Icons.navigate_next,color: Colors.white),
                    tooltip: 'Go to the next image',
                    onPressed: (){
                      imageChanged(1);
                    },
                  ),
                ),
              ],
            ),
            body: Center(
              child: Image.asset(
              images[currentImage],
              fit: BoxFit.cover, 
              width: double.infinity, 
              height: double.infinity, 
            ),
        ),
        );
      }
  }
