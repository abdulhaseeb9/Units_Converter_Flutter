import 'package:flutter/material.dart';

class HomeItemWidgets extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onPressed;
  const HomeItemWidgets({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 140, 117, 175)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              imagePath,
              width: 50,
              height: 50,
              color: Colors.yellowAccent,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
