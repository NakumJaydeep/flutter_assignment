import 'package:flutter/material.dart';

class Question1 extends StatelessWidget {
  const Question1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Question 1')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: John Doe', style: TextStyle(fontSize: 20)),
            Text('College: ABC Institute of Technology', style: TextStyle(fontSize: 20)),
            Text('Course: Computer Science', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
