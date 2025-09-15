import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Expense {
  const Expense({
    required this.title,
    required this.amount,
    required this.dateTime,
  });

  final String title;
  final double amount;
  final DateTime dateTime;
}
