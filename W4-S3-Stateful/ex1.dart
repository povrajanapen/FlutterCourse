import 'package:flutter/material.dart';
class SelectButton extends StatefulWidget {
  
  final String initialText;
  const SelectButton({super.key, required this.initialText});

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  bool isSelected = false;
  String text = 'Not Selected';

  @override
  //intialize state based on initial text so the toggle will start based on the initialtext. here button starts when its 'selected'
  void initState() {
    super.initState();
    text = widget.initialText;
    isSelected = widget.initialText == 'Selected';
  }
  void selected(){
    setState(() {
     isSelected = !isSelected;
     text = isSelected ? 'Selected' : 'Not Selected';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
          child: SizedBox(
                width: 400,
                height: 100,
                child: ElevatedButton(
                    onPressed: selected,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected ? Colors.blue[500] : Colors.blue[50],
                    ), child: Center(
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 30,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                        ),
                    ),
                    ),
              ),
        );
  }
}
void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectButton(initialText: 'Not Selected'),
            SizedBox(height: 20),
            SelectButton(initialText: 'Selected'),
            SizedBox(height: 20),
            SelectButton(initialText: 'Not Selected'),
            SizedBox(height: 20),
            SelectButton(initialText: 'Selected'),
            SizedBox(height: 20),
          ],
        ),

      ),
    ));
