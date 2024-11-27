import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';


enum Category{food, travel, leisure, work;}

  IconData getCategoryIcon(Category category) {
  switch (category) {
    case Category.food:
      return Icons.fastfood;
    case Category.travel:
      return Icons.flight;
    case Category.leisure:
      return Icons.movie;
    case Category.work:
      return Icons.work;
    default:
      return Icons.help_outline;
  }
}

const Uuid uuid = Uuid();
class Expense{

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  
  Expense({required this.title,required this.amount,required this.date, required this.category}):id = uuid.v4();
  
}