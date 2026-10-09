import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MaterialApp(home: Q6Page()));

class Q6Page extends StatefulWidget {
  const Q6Page({super.key});
  @override
  State<Q6Page> createState() => _Q6PageState();
}

class _Q6PageState extends State<Q6Page> {
  final _controller = TextEditingController();
  String _savedValue = "";

  @override
  void initState() {
    super.initState();
    _loadValue();
  }

  Future<void> _loadValue() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedValue = prefs.getString('saved_string') ?? "No value saved";
    });
  }

  Future<void> _saveValue() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_string', _controller.text);
    _loadValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 1 - Q6")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _controller, decoration: const InputDecoration(labelText: "Enter string to save")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: _saveValue, child: const Text("Save to SharedPreferences")),
            const Divider(),
            Text("Saved Value: $_savedValue", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
