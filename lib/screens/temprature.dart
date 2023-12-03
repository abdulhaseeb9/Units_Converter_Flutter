import 'package:flutter/material.dart';

class Temprature extends StatefulWidget {
  @override
  _TempratureState createState() => _TempratureState();
}

class _TempratureState extends State<Temprature> {
  TextEditingController _inputController = TextEditingController();

  String _selectedInputUnit = 'Celsius';
  String _selectedOutputUnit = 'Fahrenheit';
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: const Text("Temperature Conversion"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              style: const TextStyle(color: Colors.white),
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter Temperature'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  dropdownColor: Colors.black38,
                  value: _selectedInputUnit,
                  onChanged: (value) {
                    setState(() {
                      _selectedInputUnit = value!;
                      _convertTemperature();
                    });
                  },
                  items: ['Celsius', 'Fahrenheit', 'Kelvin']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                          style: const TextStyle(color: Colors.white)),
                    );
                  }).toList(),
                ),
                const Text(
                  'to',
                  style: TextStyle(color: Colors.white),
                ),
                DropdownButton<String>(
                  dropdownColor: Colors.black38,
                  value: _selectedOutputUnit,
                  onChanged: (value) {
                    setState(() {
                      _selectedOutputUnit = value!;
                      _convertTemperature();
                    });
                  },
                  items: ['Celsius', 'Fahrenheit', 'Kelvin']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                          style: const TextStyle(color: Colors.white)),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 140, 117, 175),
              ),
              onPressed: _convertTemperature,
              child: const Text(
                'Convert',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Result: $_result $_selectedOutputUnit',
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

  void _convertTemperature() {
    if (_inputController.text.isEmpty) {
      setState(() {
        _result = '';
      });
      return;
    }

    double inputValue = double.parse(_inputController.text);

    if (_selectedInputUnit == 'Celsius') {
      if (_selectedOutputUnit == 'Fahrenheit') {
        setState(() {
          _result = ((inputValue * 9 / 5) + 32).toStringAsFixed(2);
        });
      } else if (_selectedOutputUnit == 'Kelvin') {
        setState(() {
          _result = (inputValue + 273.15).toStringAsFixed(2);
        });
      } else {
        setState(() {
          _result = inputValue.toStringAsFixed(2);
        });
      }
    } else if (_selectedInputUnit == 'Fahrenheit') {
      if (_selectedOutputUnit == 'Celsius') {
        setState(() {
          _result = ((inputValue - 32) * 5 / 9).toStringAsFixed(2);
        });
      } else if (_selectedOutputUnit == 'Kelvin') {
        setState(() {
          _result = ((inputValue - 32) * 5 / 9 + 273.15).toStringAsFixed(2);
        });
      } else {
        setState(() {
          _result = inputValue.toStringAsFixed(2);
        });
      }
    } else if (_selectedInputUnit == 'Kelvin') {
      if (_selectedOutputUnit == 'Celsius') {
        setState(() {
          _result = (inputValue - 273.15).toStringAsFixed(2);
        });
      } else if (_selectedOutputUnit == 'Fahrenheit') {
        setState(() {
          _result = ((inputValue - 273.15) * 9 / 5 + 32).toStringAsFixed(2);
        });
      } else {
        setState(() {
          _result = inputValue.toStringAsFixed(2);
        });
      }
    }
  }
}
