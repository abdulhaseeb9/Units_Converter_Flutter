import 'package:flutter/material.dart';

class NumeralSystem extends StatefulWidget {
  const NumeralSystem({super.key});

  @override
  _NumeralSystemState createState() => _NumeralSystemState();
}

class _NumeralSystemState extends State<NumeralSystem> {
  String inputValue = '';
  String resultValue = '';
  String selectedFromSystem = 'Decimal';
  String selectedToSystem = 'Binary';

  void convert() {
    try {
      switch (selectedFromSystem) {
        case 'Decimal':
          resultValue = convertDecimal();
          break;
        case 'Binary':
          resultValue = convertBinary();
          break;
        case 'Octal':
          resultValue = convertOctal();
          break;
        case 'Hexadecimal':
          resultValue = convertHexadecimal();
          break;
        default:
          resultValue = 'Invalid input';
      }
    } catch (e) {
      resultValue = 'Invalid input';
    }

    setState(() {});
  }

  String convertDecimal() {
    int decimalValue = int.parse(inputValue);
    return convertFromDecimal(decimalValue, selectedToSystem);
  }

  String convertBinary() {
    int decimalValue = int.parse(inputValue, radix: 2);
    return convertFromDecimal(decimalValue, selectedToSystem);
  }

  String convertOctal() {
    int decimalValue = int.parse(inputValue, radix: 8);
    return convertFromDecimal(decimalValue, selectedToSystem);
  }

  String convertHexadecimal() {
    int decimalValue = int.parse(inputValue, radix: 16);
    return convertFromDecimal(decimalValue, selectedToSystem);
  }

  String convertFromDecimal(int decimalValue, String toSystem) {
    switch (toSystem) {
      case 'Binary':
        return decimalValue.toRadixString(2);
      case 'Octal':
        return decimalValue.toRadixString(8);
      case 'Decimal':
        return decimalValue.toRadixString(10);
      case 'Hexadecimal':
        return decimalValue.toRadixString(16).toUpperCase();
      default:
        return 'Invalid target system';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: const Text('Numeral System Conversion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Enter value'),
              onChanged: (value) {
                setState(() {
                  inputValue = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  dropdownColor: Colors.black38,
                  value: selectedFromSystem,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedFromSystem = newValue!;
                    });
                  },
                  items: ['Decimal', 'Binary', 'Octal', 'Hexadecimal']
                      .map((String system) {
                    return DropdownMenuItem<String>(
                      value: system,
                      child: Text(
                        system,
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
                  value: selectedToSystem,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedToSystem = newValue!;
                    });
                  },
                  items: ['Binary', 'Decimal', ' Octal', 'Hexadecimal']
                      .map((String system) {
                    return DropdownMenuItem<String>(
                      value: system,
                      child: Text(
                        system,
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
              'Result: $resultValue ',
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
