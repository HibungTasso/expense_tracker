import 'package:expense_tracker/widgets/new_expense.dart';
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
      date: DateTime.now(),
      category: Category.food,
    ),

    Expense(
      title: "Mouse",
      amount: 650,
      date: DateTime.now(),
      category: Category.work,
    ),

    Expense(
      title: "Movie Ticket",
      amount: 250,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return NewExpense(onAddExpense: addExpense);
      },
    );
  }

  void addExpense(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),

      //Expenses List
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Column(
          children: [
            Text("Chart"),
            SizedBox(height: 10),
            Expanded(child: ExpensesList(expenses_list: registeredExpenses)),
          ],
        ),
      ),
    );
  }
}
