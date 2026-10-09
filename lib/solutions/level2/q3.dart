import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MaterialApp(home: Q3Page()));

class Q3Page extends StatefulWidget {
  const Q3Page({super.key});
  @override
  State<Q3Page> createState() => _Q3PageState();
}

class _Q3PageState extends State<Q3Page> {
  final _controller = TextEditingController();
  List<String> _items = [];

  @override
  void initState() {
    super.initState();
    _loadList();
  }

  Future<void> _loadList() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _items = prefs.getStringList('saved_list') ?? [];
    });
  }

  Future<void> _addItem() async {
    if (_controller.text.isEmpty) return;
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _items.add(_controller.text);
      prefs.setStringList('saved_list', _items);
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 2 - Q3: SP ListView")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(child: TextField(controller: _controller, decoration: const InputDecoration(hintText: "Enter item"))),
                IconButton(icon: const Icon(Icons.add), onPressed: _addItem),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) => ListTile(title: Text(_items[index])),
            ),
          ),
        ],
      ),
    );
  }
}
