import 'package:flutter/material.dart';
import 'package:expense_tracker/Model/expense.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  //Controllers
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  Category _selectedCategory = Category.food; //for instance

  //Date Formater
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  String get formatDate {
    return formatter.format(DateTime.now());
  }

  //Date Picker from calender
  DateTime? _selectedDate;
  void _datePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    //after waiting/getting value
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _saveExpense() {
    String title = _titleController.text.trim();
    double? amount = double.tryParse(_amountController.text);
    if (amount == null || amount <= 0 || _selectedDate == null) {
      //Error Message
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Error"),
          content: Text("Please enter valid inputs..."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text("Close"),
            ),
          ],
        ),
      );
      return;
    }
    //This will execute when there is no error
    //creating and initializing new Expense object
    final Expense newExpense = Expense(
      title: _titleController.text.trim(),
      amount: amount,
      date: _selectedDate!,
      category: _selectedCategory,
    );
    widget.onAddExpense(newExpense);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Title
          TextField(
            controller: _titleController,
            maxLength: 35,
            decoration: InputDecoration(label: Text("Title")),
          ),

          //amount and date
          Row(
            children: [
              //Amount
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Amount"),
                    prefix: Text("Rs. "),
                  ),
                ),
              ),
              SizedBox(width: 10),

              //Date and Month
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? "Select Date"
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _datePicker,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),

          //Category Dropdown
          DropdownButton(
            hint: Text("Select Category"),
            value: _selectedCategory,
            items: Category.values
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Text(item.name.toUpperCase()),
                  ),
                )
                .toList(),
            onChanged: (newItem) {
              if (newItem == null) return;
              setState(() {
                _selectedCategory = newItem;
              });
              print("New Item: ${newItem.name}");
            },
          ),
          SizedBox(height: 10),

          //Buttons
          Row(
            children: [
              //Cancel Button
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
              ),
              SizedBox(width: 5),

              //Save Button
              Expanded(
                child: ElevatedButton(
                  onPressed: _saveExpense,
                  child: Text("Save Expense"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
