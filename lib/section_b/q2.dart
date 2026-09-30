import 'package:flutter/material.dart';

class QuestionB2 extends StatelessWidget {
  const QuestionB2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive LayoutBuilder')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Column(
              children: [
                Container(color: Colors.red, height: 100, width: double.infinity, child: const Center(child: Text('Item 1'))),
                Container(color: Colors.green, height: 100, width: double.infinity, child: const Center(child: Text('Item 2'))),
              ],
            );
          } else {
            return Row(
              children: [
                Expanded(child: Container(color: Colors.red, height: 100, child: const Center(child: Text('Item 1')))),
                Expanded(child: Container(color: Colors.green, height: 100, child: const Center(child: Text('Item 2')))),
              ],
            );
          }
        },
      ),
    );
  }
}
