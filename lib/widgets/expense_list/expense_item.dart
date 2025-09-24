import 'package:expense_tracker/Model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expenses});

  final Expense expenses;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Item Title
            Text(expenses.title, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 10),

            //Contents
            Row(
              children: [
                Text("Rs. ${expenses.amount.toStringAsFixed(2)}"),
                Spacer(),
                Row(
                  children: [
                    Icon(iconCategory[expenses.category]),
                    SizedBox(width: 5),
                    Text(expenses.formattedDate),
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
