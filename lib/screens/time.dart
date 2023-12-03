import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  double inputValue = 0;
  double resultValue = 0;

  String selectedFromUnit = 'Seconds';
  String selectedToUnit = 'Minutes';

  Map<String, double> timeconversionrate = {
    'Milliseconds': 1,
    'Seconds': 0.001,
    'Minutes': 1.66667e-5,
    'Hours': 2.77778e-7,
    'Days': 1.15741e-8,
    'Weeks': 1.65344e-9,
    'Months': 3.80517e-10,
    'Years': 3.171e-11,
  };

  void convert() {
    setState(() {
      if (timeconversionrate.containsKey(selectedFromUnit) &&
          timeconversionrate.containsKey(selectedToUnit)) {
        resultValue = inputValue *
            (timeconversionrate[selectedToUnit]! /
                timeconversionrate[selectedFromUnit]!);
      } else {
        // Handle unsupported conversion
        resultValue = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: Text('Time Conversion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Time',
              ),
              onChanged: (value) {
                setState(() {
                  inputValue = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 16),
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
                  items: timeconversionrate.keys.map((String unit) {
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
                  items: timeconversionrate.keys.map((String unit) {
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
