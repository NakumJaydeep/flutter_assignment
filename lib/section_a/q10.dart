import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class Question10 extends StatelessWidget {
  const Question10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Question 10')),
      body: ListView(
        children: const [
          SectionTitle(title: 'First Section'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Content for the first section goes here.'),
          ),
          SectionTitle(title: 'Second Section'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Content for the second section goes here.'),
          ),
        ],
      ),
    );
  }
}
