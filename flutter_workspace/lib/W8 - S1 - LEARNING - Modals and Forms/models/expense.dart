import 'package:uuid/uuid.dart';

enum ExpenType { FOOD, TRAVEL, LEISUS, WORK }

const Uuid uuid = Uuid();

class Expense {
  final String id;
  final String tittle;
  final double amount;
  final DateTime date;
  final ExpenType category;

  Expense(
      {
      required this.tittle,
      required this.amount,
      required this.date,
      required this.category}):
      this.id = uuid.v4();
}
