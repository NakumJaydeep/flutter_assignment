import 'package:flutter/material.dart';

class Question5 extends StatelessWidget {
  const Question5({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.red, Colors.green, Colors.blue,
      Colors.yellow, Colors.orange, Colors.purple,
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Question 5')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: colors.map((color) => Container(color: color)).toList(),
      ),
    );
  }
}
