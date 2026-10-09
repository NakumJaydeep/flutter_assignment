import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

void main() => runApp(const MaterialApp(home: Q9Page()));

class Q9Page extends StatefulWidget {
  const Q9Page({super.key});
  @override
  State<Q9Page> createState() => _Q9PageState();
}

class _Q9PageState extends State<Q9Page> {
  String _data = "No data yet";
  String _source = "None";

  Future<File> get _cacheFile async {
    final dir = await getApplicationDocumentsDirectory();
    return File(p.join(dir.path, 'api_cache_fallback.json'));
  }

  Future<void> _fetchWithFallback() async {
    setState(() {
      _data = "Fetching...";
      _source = "Loading...";
    });

    final file = await _cacheFile;
    const url = "https://jsonplaceholder.typicode.com/todos/1";

    try {
      // 1. Try fetching from network
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 3));
      
      if (response.statusCode == 200) {
        // 2. Success: Save to local cache
        await file.writeAsString(response.body);
        setState(() {
          _data = response.body;
          _source = "Network (Updated Cache)";
        });
      } else {
        throw Exception("Server returned ${response.statusCode}");
      }
    } catch (e) {
      // 3. Fail: Fallback to local cache
      if (await file.exists()) {
        final cachedData = await file.readAsString();
        setState(() {
          _data = cachedData;
          _source = "Local Cache (Offline Fallback)";
        });
      } else {
        setState(() {
          _data = "Error: $e and no cache found.";
          _source = "Error";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 3 - Q9: API Fallback")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Source: $_source", style: const TextStyle(fontWeight: FontWeight.bold)),
            const Divider(),
            Expanded(child: SingleChildScrollView(child: Text(_data))),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _fetchWithFallback, child: const Text("Fetch Data with Fallback")),
          ],
        ),
      ),
    );
  }
}
