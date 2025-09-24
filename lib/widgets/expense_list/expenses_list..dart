import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/Model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses_list,
    required this.onRemoveItem,
  });

  final List<Expense> expenses_list;
  final void Function(Expense expense) onRemoveItem;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return ListView.builder(
      itemCount: expenses_list.length,
      itemBuilder: (contex, index) {
        //Dismissible card
        return Dismissible(
          //show background color red when dismissing
          background: Container(
            color: isDark
                ? Color.fromARGB(150, 255, 0, 0)
                : Theme.of(context).colorScheme.error.withAlpha(100),
            margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            ),
          ),
          key: ValueKey(expenses_list[index]),
          onDismissed: (direction) {
            onRemoveItem(expenses_list[index]);
          },
          child: ExpenseItem(expenses: expenses_list[index]),
        );
      },
    );
  }
}
