import 'package:flutter/material.dart';

class Question4 extends StatelessWidget {
  const Question4({super.key});

  final List<String> fruits = const [
    'Apple', 'Banana', 'Cherry', 'Date', 'Elderberry',
    'Fig', 'Grape', 'Honeydew', 'Kiwi', 'Lemon',
    'Mango', 'Orange', 'Papaya', 'Quince'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Question 4')),
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.restaurant),
            title: Text(fruits[index]),
          );
        },
      ),
    );
  }
}
