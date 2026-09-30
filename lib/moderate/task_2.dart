import 'package:flutter/material.dart';

class ModerateTask2 extends StatefulWidget {
  const ModerateTask2({super.key});

  @override
  State<ModerateTask2> createState() => _ModerateTask2State();
}

class _ModerateTask2State extends State<ModerateTask2> {
  final List<String> _items = [
    'Apple', 'Banana', 'Cherry', 'Date', 'Elderberry', 'Fig', 'Grape', 'Honeydew'
  ];
  List<String> _filteredItems = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredItems = _items;
  }

  void _filterList(String query) {
    setState(() {
      _filteredItems = _items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Moderate 2: Filter List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              onChanged: _filterList,
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(_filteredItems[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}
