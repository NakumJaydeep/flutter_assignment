import 'package:flutter/material.dart';

class Question3 extends StatelessWidget {
  const Question3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 3'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          'This is the body text.',
          style: TextStyle(fontSize: 18),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('FAB Pressed!')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
