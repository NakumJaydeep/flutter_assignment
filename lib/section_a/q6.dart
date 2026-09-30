import 'package:flutter/material.dart';

class Question6 extends StatelessWidget {
  const Question6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Question 6')),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://picsum.photos/400/200',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const ListTile(
                title: Text('Card Title'),
                subtitle: Text('This is a short description of the card content.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
