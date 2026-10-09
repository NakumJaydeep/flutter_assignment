import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Q8Page()));

class Q8Page extends StatefulWidget {
  const Q8Page({super.key});
  @override
  State<Q8Page> createState() => _Q8PageState();
}

class _Q8PageState extends State<Q8Page> {
  // Simple in-memory cache using a Map
  final Map<String, dynamic> _apiCache = {};
  String _displayText = "No data in cache";

  void _fetchData() {
    const String key = "user_profile";
    
    if (_apiCache.containsKey(key)) {
      setState(() {
        _displayText = "Retrieved from Cache: ${_apiCache[key]}";
      });
    } else {
      // Simulating API response
      final mockResponse = {"name": "John Doe", "email": "john@example.com", "timestamp": DateTime.now().toString()};
      _apiCache[key] = mockResponse;
      setState(() {
        _displayText = "Fetched from API & Cached: $mockResponse";
      });
    }
  }

  void _clearCache() {
    setState(() {
      _apiCache.clear();
      _displayText = "Cache cleared";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 1 - Q8")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(_displayText, textAlign: TextAlign.center),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _fetchData, child: const Text("Fetch Data")),
            ElevatedButton(onPressed: _clearCache, child: const Text("Clear Cache")),
          ],
        ),
      ),
    );
  }
}
