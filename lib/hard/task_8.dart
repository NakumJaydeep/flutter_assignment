import 'package:flutter/material.dart';

class HardTask8 extends StatefulWidget {
  const HardTask8({super.key});

  @override
  State<HardTask8> createState() => _HardTask8State();
}

class _HardTask8State extends State<HardTask8> {
  int _n = 0;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hard 8: Number Pyramid')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter N'),
              onChanged: (val) => setState(() => _n = int.tryParse(val) ?? 0),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _n,
                itemBuilder: (context, i) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(i + 1, (j) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text('${j + 1}', style: const TextStyle(fontSize: 18)),
                    )),
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
