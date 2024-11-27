import 'package:flutter/material.dart';
import 'package:flutter_workspace/W6%20-%20S1%20-%20PRACTICE-%20Lists,%20Pass%20Functions/EXERCISE-1/ex_1_start.dart';
import 'package:flutter_workspace/W8 - S1 - LEARNING - Modals and Forms/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    List<Expense> _reg;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Ronan is the best in the world",
          style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.none,
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: const Column(
        children: [Expenses()],
      ),
    );
  }
}
