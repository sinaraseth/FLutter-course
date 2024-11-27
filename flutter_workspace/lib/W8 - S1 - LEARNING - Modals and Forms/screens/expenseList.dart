import 'package:flutter/material.dart';
import 'package:flutter_workspace/W8 - S1 - LEARNING - Modals and Forms/screens/expenseView.dart';
import 'package:flutter_workspace/W8%20-%20S1%20-%20LEARNING%20-%20Modals%20and%20Forms/models/expense.dart';

class Expenselist extends StatefulWidget {
  const Expenselist({super.key});

  @override
  State<Expenselist> createState() => _ExpenselistState();
}

class _ExpenselistState extends State<Expenselist> {
  List<Expense> _registeredExppenses = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ..._registeredExppenses.map((item) => Column(
              children: [
                Text(
                  item.id,
                ),
                Text(
                  item.tittle,
                ),
                Text(
                  '${item.amount}',
                ),
                Text(
                  '${item.date}',
                ),
                Text(
                  '${item.category}',
                ),
              ],
            )),
      ],
    );
  }
}
