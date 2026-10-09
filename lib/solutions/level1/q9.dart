import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Q9Page()));

class Q9Page extends StatefulWidget {
  const Q9Page({super.key});
  @override
  State<Q9Page> createState() => _Q9PageState();
}

class _Q9PageState extends State<Q9Page> {
  String _jsonString = "";
  final Map<String, dynamic> _myMap = {
    "name": "Flutter Assignment",
    "level": 1,
    "isCompleted": true,
    "tags": ["dart", "json", "mobile"]
  };

  void _convertMapToJson() {
    setState(() {
      _jsonString = jsonEncode(_myMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 1 - Q9")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Source Map: $_myMap"),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _convertMapToJson, child: const Text("Convert Map to JSON")),
            const Divider(),
            const Text("JSON String Output:", style: TextStyle(fontWeight: FontWeight.bold)),
            SelectableText(_jsonString),
          ],
        ),
      ),
    );
  }
}
