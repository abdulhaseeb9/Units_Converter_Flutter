import 'package:flutter/material.dart';

class DigitalData extends StatefulWidget {
  @override
  _DigitalDataState createState() => _DigitalDataState();
}

class _DigitalDataState extends State<DigitalData> {
  TextEditingController _inputController = TextEditingController();
  String _selectedInputUnit = 'Bits';
  String _selectedOutputUnit = 'Bytes';
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Digital Data Conversion'),
      ),
      backgroundColor: Colors.black38,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              style: const TextStyle(color: Colors.white),
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter Value'),
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
                      _convertDigitalUnits();
                    });
                  },
                  items: ['Bits', 'Bytes', 'KB', 'MB', 'GB', 'TB']
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
                      _convertDigitalUnits();
                    });
                  },
                  items: ['Bits', 'Bytes', 'KB', 'MB', 'GB', 'TB']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.white),
                      ),
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
              onPressed: _convertDigitalUnits,
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

  void _convertDigitalUnits() {
    if (_inputController.text.isEmpty) {
      setState(() {
        _result = '';
      });
      return;
    }

    double inputValue = double.parse(_inputController.text);

    switch (_selectedInputUnit) {
      case 'Bits':
        _convertBits(inputValue);
        break;
      case 'Bytes':
        _convertBytes(inputValue);
        break;
      case 'KB':
        _convertKB(inputValue);
        break;
      case 'MB':
        _convertMB(inputValue);
        break;
      case 'GB':
        _convertGB(inputValue);
        break;
      case 'TB':
        _convertTB(inputValue);
        break;
      default:
        setState(() {
          _result = inputValue.toStringAsFixed(2);
        });
    }
  }

  void _convertBits(double value) {
    switch (_selectedOutputUnit) {
      case 'Bytes':
        setState(() {
          _result = (value / 8).toStringAsFixed(2);
        });
        break;
      case 'KB':
        setState(() {
          _result = (value / 8 / 1024).toStringAsFixed(2);
        });
        break;
      case 'MB':
        setState(() {
          _result = (value / 8 / 1024 / 1024).toStringAsFixed(2);
        });
        break;
      case 'GB':
        setState(() {
          _result = (value / 8 / 1024 / 1024 / 1024).toStringAsFixed(2);
        });
        break;
      case 'TB':
        setState(() {
          _result = (value / 8 / 1024 / 1024 / 1024 / 1024).toStringAsFixed(2);
        });
        break;
      default:
        setState(() {
          _result = value.toStringAsFixed(2);
        });
    }
  }

  void _convertBytes(double value) {
    switch (_selectedOutputUnit) {
      case 'Bits':
        setState(() {
          _result = (value * 8).toStringAsFixed(2);
        });
        break;
      case 'KB':
        setState(() {
          _result = (value / 1024).toStringAsFixed(2);
        });
        break;
      case 'MB':
        setState(() {
          _result = (value / 1024 / 1024).toStringAsFixed(2);
        });
        break;
      case 'GB':
        setState(() {
          _result = (value / 1024 / 1024 / 1024).toStringAsFixed(2);
        });
        break;
      case 'TB':
        setState(() {
          _result = (value / 1024 / 1024 / 1024 / 1024).toStringAsFixed(2);
        });
        break;
      default:
        setState(() {
          _result = value.toStringAsFixed(2);
        });
    }
  }

  void _convertKB(double value) {
    switch (_selectedOutputUnit) {
      case 'Bits':
        setState(() {
          _result = (value * 8 * 1024).toStringAsFixed(2);
        });
        break;
      case 'Bytes':
        setState(() {
          _result = (value * 1024).toStringAsFixed(2);
        });
        break;
      case 'MB':
        setState(() {
          _result = (value / 1024).toStringAsFixed(2);
        });
        break;
      case 'GB':
        setState(() {
          _result = (value / 1024 / 1024).toStringAsFixed(2);
        });
        break;
      case 'TB':
        setState(() {
          _result = (value / 1024 / 1024 / 1024).toStringAsFixed(2);
        });
        break;
      default:
        setState(() {
          _result = value.toStringAsFixed(2);
        });
    }
  }

  void _convertMB(double value) {
    switch (_selectedOutputUnit) {
      case 'Bits':
        setState(() {
          _result = (value * 8 * 1024 * 1024).toStringAsFixed(2);
        });
        break;
      case 'Bytes':
        setState(() {
          _result = (value * 1024 * 1024).toStringAsFixed(2);
        });
        break;
      case 'KB':
        setState(() {
          _result = (value * 1024).toStringAsFixed(2);
        });
        break;
      case 'GB':
        setState(() {
          _result = (value / 1024).toStringAsFixed(2);
        });
        break;
      case 'TB':
        setState(() {
          _result = (value / 1024 / 1024).toStringAsFixed(2);
        });
        break;
      default:
        setState(() {
          _result = value.toStringAsFixed(2);
        });
    }
  }

  void _convertGB(double value) {
    switch (_selectedOutputUnit) {
      case 'Bits':
        setState(() {
          _result = (value * 8 * 1024 * 1024 * 1024).toStringAsFixed(2);
        });
        break;
      case 'Bytes':
        setState(() {
          _result = (value * 1024 * 1024 * 1024).toStringAsFixed(2);
        });
        break;
      case 'KB':
        setState(() {
          _result = (value * 1024 * 1024).toStringAsFixed(2);
        });
        break;
      case 'MB':
        setState(() {
          _result = (value * 1024).toStringAsFixed(2);
        });
        break;
      case 'TB':
        setState(() {
          _result = (value / 1024).toStringAsFixed(2);
        });
        break;
      default:
        setState(() {
          _result = value.toStringAsFixed(2);
        });
    }
  }

  void _convertTB(double value) {
    switch (_selectedOutputUnit) {
      case 'Bits':
        setState(() {
          _result = (value * 8 * 1024 * 1024 * 1024 * 1024).toStringAsFixed(2);
        });
        break;
      case 'Bytes':
        setState(() {
          _result = (value * 1024 * 1024 * 1024 * 1024).toStringAsFixed(2);
        });
        break;
      case 'KB':
        setState(() {
          _result = (value * 1024 * 1024 * 1024).toStringAsFixed(2);
        });
        break;
      case 'MB':
        setState(() {
          _result = (value * 1024 * 1024).toStringAsFixed(2);
        });
        break;
      case 'GB':
        setState(() {
          _result = (value * 1024).toStringAsFixed(2);
        });
        break;
      default:
        setState(() {
          _result = value.toStringAsFixed(2);
        });
    }
  }
}
