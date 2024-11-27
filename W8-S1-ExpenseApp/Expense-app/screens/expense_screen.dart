import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'package:intl/intl.dart';

const Color mainColor = Color(0xff037ef3);
class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor.withAlpha(50),
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text(
          'The Best Expense App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          ),
          actions: <Widget> [
            IconButton( 
              onPressed: (){},
              icon: const Icon(Icons.add,color: Colors.white,)),
          ],
        centerTitle: false,
      ),
      
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: _registeredExpenses.length,
        itemBuilder: (context, index){
          final expense = _registeredExpenses[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(
                expense.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                expense.amount.toString(),
              ),

            trailing: Row(
            mainAxisSize: MainAxisSize.min, 
            children: [
              Icon(
                getCategoryIcon(expense.category),
                color: Colors.blue,
              ),
              const SizedBox(width: 8), 
              Text(
                DateFormat.yMd().format(expense.date), 
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ],
          ),
            ),
          );
        }
      ),
    );
  }
}