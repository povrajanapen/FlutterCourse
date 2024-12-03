import 'package:flutter/material.dart';
import 'device_button.dart';
 
class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
 
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  final _dollarController = TextEditingController();
  String _selectedCurrency = 'EURO';
  final List<String> _currencyList= ['EURO', 'RIELS', 'DONG'];
  double convertedAmount = 0.0;
  double inputAmount = 0.0;

//convert currency
  void convertAmount(){
    //input's listenter, check if input amount is valid and parse it
    inputAmount = double.tryParse(_dollarController.text) ?? 0.0;
    setState(() {
      switch (_selectedCurrency) {
        case 'EURO':
          convertedAmount = inputAmount * 0.9;
          break;
        case 'RIELS':
          convertedAmount = inputAmount * 4100.0;
          break;
        case 'DONG':
          convertedAmount = inputAmount * 24000.0;
          break;  
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.money,
            size: 60,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Amount in dollars:"),
          const SizedBox(height: 10),

        //input amount in dollars
          TextField(
              controller: _dollarController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                  prefix: const Text('\$ '),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter an amount in dollar',
                  hintStyle: const TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white),
              onChanged: (value){
                convertAmount();
              },
            ),

          const SizedBox(height: 30),
          const Text("Device:"),
          const SizedBox(height: 10,),

        //dropdown button
          DeviceButton(
            selectedCurrency: _selectedCurrency,
            currencyList: _currencyList, 
            onChanged: (newCurrency){
              setState(() {
                _selectedCurrency = newCurrency;
              });
              //recalculate conversion when currency changes
              convertAmount();
            }
          ),

          const SizedBox(height: 30),
          const Text("Amount in selected device:"),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(
                //show converted amount from input
                convertedAmount.toStringAsFixed(2),
              ))
        ],
      )),
    );
  }
}
