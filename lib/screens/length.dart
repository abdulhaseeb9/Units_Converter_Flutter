import 'package:flutter/material.dart';

class Length extends StatefulWidget {
  @override
  _LengthState createState() => _LengthState();
}

class _LengthState extends State<Length> {
  double inputValue = 0;
  double resultValue = 0;

  String selectedFromUnit = 'Meter';
  String selectedToUnit = 'Feet';

  Map<String, double> length_conversion_rates = {
    'Inches': 39.3701,
    'Feet': 3.28084,
    'Meter': 1,
    'Yard': 1.09361,
    'Centimeters': 100,
    'Miles': 0.000621371,
    'Kilometers': 0.001,
  };

  void convert() {
    setState(() {
      resultValue = inputValue *
          (length_conversion_rates[selectedToUnit]! /
              length_conversion_rates[selectedFromUnit]!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: const Text('Length Conversion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter value'),
              onChanged: (value) {
                setState(() {
                  inputValue = double.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  dropdownColor: Colors.black38,
                  value: selectedFromUnit,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedFromUnit = newValue!;
                    });
                  },
                  items: length_conversion_rates.keys.map((String unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(
                        unit,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
                const Text(
                  'to',
                  style: TextStyle(color: Colors.white),
                ),
                DropdownButton<String>(
                  dropdownColor: Colors.black38,
                  value: selectedToUnit,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedToUnit = newValue!;
                    });
                  },
                  items: length_conversion_rates.keys.map((String unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(
                        unit,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 140, 117, 175),
              ),
              onPressed: convert,
              child: const Text(
                'Convert',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Result: $resultValue $selectedToUnit',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
