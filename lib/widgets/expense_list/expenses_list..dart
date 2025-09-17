import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/Model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses_list});

  final List<Expense> expenses_list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses_list.length,
      itemBuilder: (contex, index) {
        return ExpenseItem(expenses: expenses_list[index]);
      },
    );
  }
}
