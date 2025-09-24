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

  //Onpress Overlay
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return NewExpense(onAddExpense: addExpense);
      },
    );
  }

  //Add Expense
  void addExpense(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  //Remove Expense
  void removeExpense(Expense expense) {
    setState(() {
      registeredExpenses.remove(expense);
    });
    //clear any previous snackbar
    ScaffoldMessenger.of(context).clearSnackBars();

    //Show SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Item Removed"),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              registeredExpenses.add(expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(child: Text("No content to show"));

    if (registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses_list: registeredExpenses,
        onRemoveItem: removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.deepPurpleAccent,
        title: Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: Icon(Icons.add /*color: Colors.white*/),
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
            Expanded(child: mainContent),
          ],
        ),
      ),
    );
  }
}
