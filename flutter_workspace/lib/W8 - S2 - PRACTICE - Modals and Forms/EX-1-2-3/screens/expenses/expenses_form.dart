import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';
import 'package:flutter_workspace/W8 - S2 - PRACTICE - Modals and Forms/EX-1-2-3/screens/expenses/expenses_list.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  Category? _selectCategory;
  DateTime? _selectDate;

  String? get title => _titleController.text;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  void onAdd() {
    // 1- Get the values from inputs
    String title = _titleController.text;
    double? amount = double.tryParse(_valueController.text.trim());

//warning for title not input
    if (title.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Please fill title!"),
              actions: [
                TextButton(onPressed: onCancel, child: const Text('Yes'))
              ],
            );
          });
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text("Please fill title!")),
      // );
      // return;
    }

// warning for amount not input or amount smaller than 0
    if (amount == null || amount < 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Please fill amount"),
              actions: [
                TextButton(onPressed: onCancel, child: const Text('Okay'))
              ],
            );
          });
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text("Please input amount")),
      // );
      return;
    }

//warning for category not fill
    if (_selectCategory == null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Please Choose category!"),
              actions: [
                TextButton(onPressed: onCancel, child: const Text('Yes'))
              ],
            );
          });
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text("Please select a category!")),
      // );
      return;
    }

//warning for date not input or picker
    if (_selectDate == null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Please choose date!"),
              actions: [
                TextButton(onPressed: onCancel, child: const Text('Yes'))
              ],
            );
          });
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text("Please pick date!")),
      // );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Add succecfull"),
          duration: Duration(seconds: 5),
        ),
      );
    }

    // 2- Create the expense
    Expense expense = Expense(
        title: title,
        amount: amount,
        date: _selectDate!,
        category: _selectCategory!);

    // 3- Ask the parent to add the expense
    widget.onCreated(expense);

    // 4- Close modal
    Navigator.pop(context);
    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: const Text("Succesfully!"),
    //         actions: [
    //           TextButton(
    //               onPressed: onAdd,
    //               child: const Text("Okay"))
    //         ],
    //       );
    //     });
  }

  Future<void> _selectedDate() async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(200),
        lastDate: DateTime(2026));

    if (pickedDate != null) {
      setState(() {
        _selectDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            controller: _valueController,
            maxLength: 50,
            decoration: const InputDecoration(
              prefix: Text('\$ '),
              label: Text('Amount'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<Category>(
                  value: _selectCategory,
                  items: Category.values.map((category) {
                    return DropdownMenuItem<Category>(
                        value: category,
                        child: Row(
                          children: [
                            Icon(category.icon),
                            const SizedBox(width: 10),
                            Text(category.name.toUpperCase()),
                          ],
                        ));
                  }).toList(),
                  onChanged: (Category? value) {
                    setState(() {
                      _selectCategory = value;
                    });
                  }),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: _selectedDate,
                  ),
                  Text(_selectDate == null
                      ? 'Select Date'
                      : '${_selectDate!.day}/${_selectDate!.month}/${_selectDate!.year}/')
                ],
              ),
            ],
          ),
          // DropdownButton(
          //   items: const [
          //     DropdownMenuItem(
          //       value: "Flutter",
          //       child: Text("Flutter"),
          //     ),
          //   ],
          //   onChanged: (Object? value) {},
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(onPressed: onAdd, child: const Text('Create')),
            ],
          )
        ],
      ),
    );
  }
}
