import 'package:flutter/material.dart';

class QuestionC1 extends StatelessWidget {
  const QuestionC1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive Dashboard')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 900) {
            // Desktop: Three-panel Row
            return Row(
              children: [
                Container(width: 200, color: Colors.blue[100], child: const Center(child: Text('Sidebar'))),
                Expanded(child: _buildGrid(3)),
                Container(width: 250, color: Colors.green[100], child: const Center(child: Text('Details'))),
              ],
            );
          } else if (constraints.maxWidth > 600) {
            // Tablet: Two-column grid
            return _buildGrid(2);
          } else {
            // Mobile: Single-column list
            return _buildList();
          }
        },
      ),
    );
  }

  Widget _buildGrid(int count) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: count),
      itemCount: 10,
      itemBuilder: (ctx, i) => Card(child: Center(child: Text('Item $i'))),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (ctx, i) => ListTile(title: Text('Item $i'), subtitle: const Text('Subtitle')),
    );
  }
}
