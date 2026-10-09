import 'package:flutter/material.dart';

class CacheItem<T> {
  final T data;
  final DateTime expiryTime;

  CacheItem(this.data, int expiryMinutes)
      : expiryTime = DateTime.now().add(Duration(minutes: expiryMinutes));

  bool get isExpired => DateTime.now().isAfter(expiryTime);
}

void main() => runApp(const MaterialApp(home: Q5Page()));

class Q5Page extends StatefulWidget {
  const Q5Page({super.key});
  @override
  State<Q5Page> createState() => _Q5PageState();
}

class _Q5PageState extends State<Q5Page> {
  final Map<String, CacheItem<String>> _cache = {};
  String _status = "Cache is empty";

  void _saveToCache() {
    // Save data with a 5-minute expiry
    _cache['my_key'] = CacheItem("Sensitive Data", 5);
    setState(() => _status = "Data saved to cache (Expires in 5 mins)");
  }

  void _checkCache() {
    final item = _cache['my_key'];
    if (item == null) {
      setState(() => _status = "No data in cache");
    } else if (item.isExpired) {
      _cache.remove('my_key');
      setState(() => _status = "Cache expired! Fetching fresh data...");
    } else {
      setState(() => _status = "Cache valid: ${item.data}\nExpires at: ${item.expiryTime}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 3 - Q5: Expiry Cache")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_status, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _saveToCache, child: const Text("Save to Cache (5 min)")),
            ElevatedButton(onPressed: _checkCache, child: const Text("Check Cache")),
          ],
        ),
      ),
    );
  }
}
