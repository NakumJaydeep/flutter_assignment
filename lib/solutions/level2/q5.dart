import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Q5Page()));

class Q5Page extends StatefulWidget {
  const Q5Page({super.key});
  @override
  State<Q5Page> createState() => _Q5PageState();
}

class _Q5PageState extends State<Q5Page> {
  // Simple in-memory cache
  final Map<String, String> _cache = {"https://api.example.com/data": "Cached Data Value"};
  String _status = "Cache contains 1 item";

  void _clearCache() {
    setState(() {
      _cache.clear();
      _status = "Cache cleared! Next request will fetch fresh data.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 2 - Q5: Clear Cache Button")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_status),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _clearCache,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
              child: const Text("Clear Cache"),
            ),
          ],
        ),
      ),
    );
  }
}
