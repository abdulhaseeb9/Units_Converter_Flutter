import 'package:flutter/material.dart';

class Mass extends StatefulWidget {
  @override
  _MassState createState() => _MassState();
}

class _MassState extends State<Mass> {
  double inputValue = 0;
  double resultValue = 0;

  String selectedFromUnit = 'Gram';
  String selectedToUnit = 'Kilogram';

  Map<String, double> mass_conversion_rates = {
    'Gram': 1,
    'Kilogram': 0.001,
    'Pound': 0.00220462,
    'Ton': 1e-6,
  };

  void convert() {
    setState(() {
      resultValue = inputValue *
          (mass_conversion_rates[selectedToUnit]! /
              mass_conversion_rates[selectedFromUnit]!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: const Text('Mass Conversion'),
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
                  items: mass_conversion_rates.keys.map((String unit) {
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
                  items: mass_conversion_rates.keys.map((String unit) {
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
