import 'package:flutter/material.dart';
import 'package:expense_tracker/Model/expense.dart';
import 'package:expense_tracker/widgets/expense_list/expenses_list..dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  //Dummy Data for testing
  final List<Expense> registeredExpenses = [
    Expense(
      title: "Bread",
      amount: 20,
      dateTime: DateTime.now(),
      category: Category.food,
    ),

    Expense(
      title: "Mouse",
      amount: 650,
      dateTime: DateTime.now(),
      category: Category.work,
    ),

    Expense(
      title: "Movie Ticket",
      amount: 250,
      dateTime: DateTime.now(),
      category: Category.travel,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: [
              Text("Chart"),
              SizedBox(height: 10),
              Expanded(child: ExpensesList(expenses_list: registeredExpenses)),
            ],
          ),
        ),
      ),
    );
  }
}
