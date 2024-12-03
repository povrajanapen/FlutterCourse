import 'package:flutter/material.dart';
import 'package:test/W8/W8-S2-ModalsandForms/EX-1-2-3-Expense-App/models/expense.dart';


class CategoryButton extends StatefulWidget {
  final Function(Category) onCategoryChanged;
  const CategoryButton({
    required this.onCategoryChanged,
    super.key});

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

List<Category> get allCategories => Category.values;

class _CategoryButtonState extends State<CategoryButton> {
  Category selectedCategory = Category.food;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Category>(
      value: selectedCategory, 
      icon: const Icon(Icons.arrow_drop_down), 
      onChanged: (Category? newValue) {
        if (newValue != null) {
        setState(() {
          selectedCategory = newValue;
        });
        }
        widget.onCategoryChanged(newValue!);
      },
      items: Category.values.map((Category category){
        return DropdownMenuItem<Category>(
          value: category,
          child: Row(
            children: [
              Icon(category.icon),
              const SizedBox(width: 8),
              Text(
                category.toString().split('.').last.toUpperCase(),
              ),
            ],
          ),
        );
    }).toList(),
);
}
}