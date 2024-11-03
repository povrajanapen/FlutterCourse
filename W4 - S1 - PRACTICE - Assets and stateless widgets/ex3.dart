import 'package:flutter/material.dart';

enum ButtonType { 
  primary(Colors.blue), 
  secondary(Colors.green), 
  disabled (Colors.grey);
  
  final Color color;
  const ButtonType(this.color);
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Custom Buttons'),
        centerTitle: false,
      ),
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(
              label: 'Submit',
              icon: Icons.check,
              buttonType: ButtonType.primary,
              iconOnLeft: true,
            ),
            SizedBox(height: 10),
            CustomButton(
              label: 'Time',
              icon: Icons.access_time,
              buttonType: ButtonType.secondary,
              iconOnLeft: false,
            ),
            SizedBox(height: 10),
            CustomButton(
              label: 'Account',
              icon: Icons.account_circle,
              buttonType: ButtonType.disabled,
              iconOnLeft: true,
            ),
          ],
        ),
      ),
    ),
  ));
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.label,
    required this.icon,
    this.buttonType = ButtonType.primary,
    this.iconOnLeft = true,
    super.key,
  });

  final String label;
  final IconData icon;
  final ButtonType buttonType;
  final bool iconOnLeft;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: buttonType == ButtonType.disabled ? null : () {},
      style: TextButton.styleFrom(
        backgroundColor: buttonType.color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: iconOnLeft
            ? [
                Icon(icon),
                const SizedBox(width: 8),
                Text(label),
              ]
            : [
                Text(label),
                const SizedBox(width: 8),
                Icon(icon),
              ],
      ),
    );
  }
}


