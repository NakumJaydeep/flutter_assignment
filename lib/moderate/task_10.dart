import 'package:flutter/material.dart';

class ModerateTask10 extends StatefulWidget {
  const ModerateTask10({super.key});

  @override
  State<ModerateTask10> createState() => _ModerateTask10State();
}

class _ModerateTask10State extends State<ModerateTask10> {
  final TextEditingController _controller = TextEditingController();
  int _rows = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Moderate 10: Star Pattern')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter number of rows'),
              onChanged: (value) {
                setState(() {
                  _rows = int.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _rows,
                itemBuilder: (context, index) {
                  return Text(
                    '* ' * (index + 1),
                    style: const TextStyle(fontSize: 20),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
