import 'package:flutter/material.dart';

class HardTask5 extends StatefulWidget {
  const HardTask5({super.key});

  @override
  State<HardTask5> createState() => _HardTask5State();
}

class _HardTask5State extends State<HardTask5> {
  bool _isListView = true;
  final List<String> _items = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hard 5: Toggle List/Grid'),
        actions: [
          IconButton(
            icon: Icon(_isListView ? Icons.grid_view : Icons.list),
            onPressed: () => setState(() => _isListView = !_isListView),
          )
        ],
      ),
      body: _isListView
          ? ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) => ListTile(
                leading: const CircleAvatar(child: Icon(Icons.star)),
                title: Text(_items[index]),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _items.length,
              itemBuilder: (context, index) => Card(
                color: Colors.blue.shade100,
                child: Center(child: Text(_items[index])),
              ),
            ),
    );
  }
}
