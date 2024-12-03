import 'package:flutter/material.dart';

class DeviceButton extends StatefulWidget {
  final String selectedCurrency;
  final List<String> currencyList;
  final ValueChanged<String> onChanged;
  const DeviceButton({
    required this.selectedCurrency,
    required this.currencyList,
    required this.onChanged,
    super.key});

  @override
  State<DeviceButton> createState() => _DeviceButtonState();
}

class _DeviceButtonState extends State<DeviceButton> {

  late String currentCurrency;

  @override 
  void initState() {
    super.initState();
    currentCurrency = widget.selectedCurrency;
  }
  
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: currentCurrency,
      dropdownColor: Colors.orange[600],
      items: widget.currencyList.map((currency){
        return DropdownMenuItem<String>(
          value: currency,
          child: Text(currency),
        );
      }).toList(),
    onChanged: (newValue){
      if(newValue != null){
        setState(() {
          currentCurrency = newValue;
        });
        widget.onChanged(newValue);
      }
    });
  }
}