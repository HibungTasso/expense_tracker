import 'package:expense_tracker/Model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expenses});

  final Expense expenses;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        child: Column(
          children: [
            Text(expenses.title),
            SizedBox(height: 5),
            Row(
              children: [
                Text("Rs. ${expenses.amount.toStringAsFixed(2)}"),
                Spacer(),
                Row(
                  children: [
                    Icon(Icons.alarm),
                    SizedBox(width: 5),
                    Text(expenses.dateTime.toString()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
