import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Q10Page()));

class Q10Page extends StatefulWidget {
  const Q10Page({super.key});
  @override
  State<Q10Page> createState() => _Q10PageState();
}

class _Q10PageState extends State<Q10Page> {
  final String _jsonString = '{"id": 101, "title": "Dart Mastery", "published": true}';
  String _displayText = "Click button to decode JSON";

  void _decodeJson() {
    Map<String, dynamic> decodedMap = jsonDecode(_jsonString);
    setState(() {
      _displayText = "Decoded Map: $decodedMap\n\nValues:\nID: ${decodedMap['id']}\nTitle: ${decodedMap['title']}\nPublished: ${decodedMap['published']}";
    });
    print("Decoded ID: ${decodedMap['id']}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 1 - Q10")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("Source JSON String:", style: TextStyle(fontWeight: FontWeight.bold)),
            SelectableText(_jsonString),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _decodeJson, child: const Text("Decode JSON to Map")),
            const Divider(),
            const Text("Output:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(_displayText),
          ],
        ),
      ),
    );
  }
}
