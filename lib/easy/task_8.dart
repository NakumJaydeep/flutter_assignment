import 'package:flutter/material.dart';

class EasyTask8 extends StatefulWidget {
  const EasyTask8({super.key});

  @override
  State<EasyTask8> createState() => _EasyTask8State();
}

class _EasyTask8State extends State<EasyTask8> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Easy 8: Checkbox toggle')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isChecked ? 'Checked' : 'Unchecked',
              style: const TextStyle(fontSize: 24),
            ),
            Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
