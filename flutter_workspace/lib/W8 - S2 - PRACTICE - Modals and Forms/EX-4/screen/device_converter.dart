import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

//map for convert from dollar
  final Map<String, double> convertRate = {
    'Euro': 0.85,
    'Riels': 4100.00,
    'Dong': 24000.00,
  };

//to store currency, input number, convert
  String? selectCurrency;
  String convertValue = '';
  final TextEditingController dollarController = TextEditingController();

//calculator for conversion
  void convertCurrency() {
    if (selectCurrency != null && dollarController.text.isNotEmpty) {
      double dollars = double.tryParse(dollarController.text) ?? 0;
      double rate = convertRate[selectCurrency]!;
      double result = dollars * rate;

      setState(() {
        convertValue = result.toStringAsFixed(2);
      });
    }
  }

  @override
  void initState() {
    super.initState();

//add listener to recalculate conversion when input changes
    dollarController.addListener(() {
      convertCurrency();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.money,
            size: 60,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Amount in dollars:"),
          const SizedBox(height: 10),
          TextField(
              controller: dollarController, //text dollar control
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                  prefix: const Text('\$ '),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter an amount in dollar',
                  hintStyle: const TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 30),
          const Text("Device:"),
          DropdownButton<String>(
            value: selectCurrency,
            items: convertRate.keys.map((String key) {
              return DropdownMenuItem(
                value: key,
                child: Text(key),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectCurrency = value!;
                convertCurrency(); //update conversion when seleted
              });
            },
            hint: const Text(
              'Select Currency',
              style: TextStyle(color: Colors.white),
            ),
            dropdownColor: Colors.orange,
            style: const TextStyle(color: Colors.black, fontSize: 18),
            isExpanded: true,
          ),
          const SizedBox(height: 30),
          const Text("Amount in selected device:"),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(
                convertValue.isEmpty ? 'Amount' : convertValue,
                style: const TextStyle(color: Colors.black),
              ))
        ],
      )),
    );
  }
}
