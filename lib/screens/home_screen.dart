import 'package:flutter/material.dart';
import 'package:units_converters/components/home_items-widgets.dart';
import 'package:units_converters/screens/digital_data.dart';
import 'package:units_converters/screens/length.dart';
import 'package:units_converters/screens/mass.dart';
import 'package:units_converters/screens/numeral_system.dart';
import 'package:units_converters/screens/statistic_calculation.dart';
import 'package:units_converters/screens/temprature.dart';
import 'package:units_converters/screens/time.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: const Text('Units Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            HomeItemWidgets(
                title: 'Length',
                imagePath: 'assets/logos/ruler.png',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return Length();
                  }));
                }),
            const SizedBox(
              height: 20,
            ),
            HomeItemWidgets(
                title: 'Mass',
                imagePath: 'assets/logos/mass.png',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return Mass();
                  }));
                }),
            const SizedBox(
              height: 20,
            ),
            HomeItemWidgets(
                title: 'Time',
                imagePath: 'assets/logos/clock.png',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return const Time();
                  }));
                }),
            const SizedBox(
              height: 20,
            ),
            HomeItemWidgets(
                title: 'Temprature',
                imagePath: 'assets/logos/celsius.png',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return Temprature();
                  }));
                }),
            const SizedBox(
              height: 20,
            ),
            HomeItemWidgets(
                title: 'Digital Data',
                imagePath: 'assets/logos/binary-code.png',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return DigitalData();
                  }));
                }),
            const SizedBox(
              height: 20,
            ),
            HomeItemWidgets(
                title: 'Numeral System',
                imagePath: 'assets/logos/numeral.png',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return const NumeralSystem();
                  }));
                }),
            const SizedBox(
              height: 20,
            ),
            HomeItemWidgets(
                title: 'Statistic calculator',
                imagePath: 'assets/logos/statistics.png',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return const StatisticalCalculator();
                  }));
                }),
          ],
        ),
      ),
    );
  }
}
