import 'package:flutter/material.dart';
import 'package:units_converters/screens/splash_screen.dart';

void main() => runApp(UnitConverterApp());

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 21,
            ),
            backgroundColor: Colors.black12,
            centerTitle: true,
            elevation: 1),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
