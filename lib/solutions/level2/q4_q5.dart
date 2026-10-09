import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MaterialApp(home: Q4Q5Page()));

class Q4Q5Page extends StatefulWidget {
  const Q4Q5Page({super.key});
  @override
  State<Q4Q5Page> createState() => _Q4Q5PageState();
}

class _Q4Q5PageState extends State<Q4Q5Page> {
  // Simple in-memory cache
  final Map<String, String> _cache = {};
  String _data = "No data loaded";
  bool _isLoading = false;

  Future<void> _fetchData() async {
    const String url = "https://jsonplaceholder.typicode.com/posts/1";
    
    // Cache-first logic
    if (_cache.containsKey(url)) {
      setState(() {
        _data = "Retrieved from CACHE:\n${_cache[url]}";
      });
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        _cache[url] = response.body;
        setState(() {
          _data = "Fetched from NETWORK:\n${response.body}";
        });
      } else {
        setState(() => _data = "Server Error: ${response.statusCode}");
      }
    } catch (e) {
      setState(() => _data = "Error: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _clearCache() {
    _cache.clear();
    setState(() => _data = "Cache cleared");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 2 - Q4 & Q5")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_isLoading) const CircularProgressIndicator(),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_data),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _fetchData, child: const Text("Fetch Data")),
                ElevatedButton(onPressed: _clearCache, child: const Text("Clear Cache")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
