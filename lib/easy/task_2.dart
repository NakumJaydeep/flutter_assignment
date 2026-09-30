import 'package:flutter/material.dart';

class EasyTask2 extends StatelessWidget {
  const EasyTask2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Easy 2: ListTile with Icon')),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text('Person ${index + 1}'),
            subtitle: Text('Details about person ${index + 1}'),
          );
        },
      ),
    );
  }
}
