import 'package:flutter/material.dart';
import 'dart:math';

class StatisticalCalculator extends StatefulWidget {
  const StatisticalCalculator({super.key});

  @override
  _StatisticalCalculatorState createState() => _StatisticalCalculatorState();
}

class _StatisticalCalculatorState extends State<StatisticalCalculator> {
  TextEditingController dataController = TextEditingController();
  List<double> dataList = [];
  double minValue = 0;
  double maxValue = 0;
  double range = 0;
  double mean = 0;
  double standardDeviation = 0;
  double regressionSlope = 0;
  double correlationCoefficient = 0;

  void calculateStatistics() {
    // Parse input data
    dataList = dataController.text
        .split(',')
        .map((String value) => double.tryParse(value) ?? 0)
        .toList();

    // Calculate statistical measures
    minValue = dataList.isNotEmpty ? dataList.reduce(min) : 0;
    maxValue = dataList.isNotEmpty ? dataList.reduce(max) : 0;
    range = maxValue - minValue;
    mean = dataList.isNotEmpty
        ? dataList.reduce((a, b) => a + b) / dataList.length
        : 0;

    // Calculate standard deviation
    standardDeviation = dataList.isNotEmpty
        ? sqrt(dataList
                .map((value) => pow(value - mean, 2))
                .reduce((a, b) => a + b) /
            dataList.length)
        : 0;

    // Calculate regression and correlation
    if (dataList.length >= 2) {
      double sumXY = 0;
      double sumX = 0;
      double sumY = 0;
      double sumXSquare = 0;
      double sumYSquare = 0;

      for (int i = 0; i < dataList.length; i++) {
        sumXY += i * dataList[i];
        sumX += i;
        sumY += dataList[i];
        sumXSquare += pow(i, 2);
        sumYSquare += pow(dataList[i], 2);
      }

      regressionSlope = (dataList.length * sumXY - sumX * sumY) /
          (dataList.length * sumXSquare - pow(sumX, 2));
      correlationCoefficient = (dataList.length * sumXY - sumX * sumY) /
          sqrt((dataList.length * sumXSquare - pow(sumX, 2)) *
              (dataList.length * sumYSquare - pow(sumY, 2)));
    }

    // Trigger a rebuild to display the results
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: const Text('Statistical Calculator'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                style: const TextStyle(color: Colors.white),
                controller: dataController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: 'Enter data (comma-separated)',
                    labelStyle: TextStyle(color: Colors.white70)),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 140, 117, 175)),
                onPressed: calculateStatistics,
                child: const Text(
                  'Result',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Minimum: $minValue',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              Text(
                'Maximum: $maxValue',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              Text(
                'Range: $range',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              Text(
                'Mean: $mean',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              Text(
                'Standard Deviation: $standardDeviation',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              Text(
                'Regression Slope: $regressionSlope',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              Text(
                'Correlation Coefficient: $correlationCoefficient',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
