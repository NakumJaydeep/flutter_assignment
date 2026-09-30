import 'package:flutter/material.dart';

class EasyTask1 extends StatelessWidget {
  const EasyTask1({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> names = [
      'Alice', 'Bob', 'Charlie', 'David', 'Eve',
      'Frank', 'Grace', 'Heidi', 'Ivan', 'Judy'
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Easy 1: ListView.builder')),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(names[index]),
          );
        },
      ),
    );
  }
}
