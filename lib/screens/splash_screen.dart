import 'package:flutter/material.dart';
import 'package:units_converters/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to the next screen or perform any other action after splash animation
        _navigateToNextScreen();
      }
    });

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  void _navigateToNextScreen() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(image: AssetImage('assets/logos/SplashScreen.png')),
          ),
        ),
      ),
    );
  }
}
