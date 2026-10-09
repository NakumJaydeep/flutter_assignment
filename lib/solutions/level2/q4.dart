import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MaterialApp(home: Q4Page()));

class Q4Page extends StatefulWidget {
  const Q4Page({super.key});
  @override
  State<Q4Page> createState() => _Q4PageState();
}

class _Q4PageState extends State<Q4Page> {
  final Map<String, String> _cache = {};
  String _data = "Click to fetch data (Cache-first)";
  bool _isLoading = false;

  Future<void> _fetchData() async {
    const String url = "https://jsonplaceholder.typicode.com/posts/1";
    
    // Level 2 Q4 Logic: Check memory cache before calling network API
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 2 - Q4: Cache-first Loader")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_isLoading) const CircularProgressIndicator(),
            Expanded(child: SingleChildScrollView(child: Text(_data))),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _fetchData, child: const Text("Fetch Data")),
          ],
        ),
      ),
    );
  }
}
