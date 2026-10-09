import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:connectivity_plus/connectivity_plus.dart';

void main() => runApp(const MaterialApp(home: Q10Page()));

class DataItem {
  final int id;
  String title;
  bool isModifiedLocally;

  DataItem({required this.id, required this.title, this.isModifiedLocally = false});

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'isModifiedLocally': isModifiedLocally};
  factory DataItem.fromJson(Map<String, dynamic> json) => DataItem(
    id: json['id'],
    title: json['title'],
    isModifiedLocally: json['isModifiedLocally'] ?? false,
  );
}

class Q10Page extends StatefulWidget {
  const Q10Page({super.key});
  @override
  State<Q10Page> createState() => _Q10PageState();
}

class _Q10PageState extends State<Q10Page> {
  List<DataItem> _items = [];
  bool _isLoading = false;
  String _status = "Initializing...";

  @override
  void initState() {
    super.initState();
    _initializeData();
    Connectivity().onConnectivityChanged.listen((result) {
      if (result != ConnectivityResult.none) {
        _syncModifiedItems();
      }
    });
  }

  Future<File> get _cacheFile async {
    final dir = await getApplicationDocumentsDirectory();
    return File(p.join(dir.path, 'pipeline_cache.json'));
  }

  Future<void> _initializeData() async {
    setState(() => _isLoading = true);
    final file = await _cacheFile;
    
    // 1. Try loading from local file (Next app launch)
    if (await file.exists()) {
      final content = await file.readAsString();
      final List jsonList = jsonDecode(content);
      setState(() {
        _items = jsonList.map((j) => DataItem.fromJson(j)).toList();
        _status = "Loaded from Local Cache";
        _isLoading = false;
      });
    } else {
      // 2. If no local, fetch from API
      await _fetchFromApi();
    }
  }

  Future<void> _fetchFromApi() async {
    setState(() => _isLoading = true);
    try {
      final res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos?_limit=5'));
      if (res.statusCode == 200) {
        final List jsonList = jsonDecode(res.body);
        _items = jsonList.map((j) => DataItem.fromJson({'id': j['id'], 'title': j['title']})).toList();
        await _saveLocally();
        setState(() => _status = "Fetched from API & Cached");
      }
    } catch (e) {
      setState(() => _status = "Fetch Error: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _saveLocally() async {
    final file = await _cacheFile;
    await file.writeAsString(jsonEncode(_items.map((i) => i.toJson()).toList()));
  }

  void _editItem(int index) {
    final controller = TextEditingController(text: _items[index].title);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Item"),
        content: TextField(controller: controller),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _items[index].title = controller.text;
                _items[index].isModifiedLocally = true;
              });
              _saveLocally();
              Navigator.pop(context);
              _syncModifiedItems(); // Try to sync immediately
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  Future<void> _syncModifiedItems() async {
    var connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.none) return;

    final modified = _items.where((i) => i.isModifiedLocally).toList();
    if (modified.isEmpty) return;

    setState(() => _status = "Syncing changes to server...");

    for (var item in modified) {
      // Mock API PUT request
      await Future.delayed(const Duration(seconds: 1));
      print("Synced item ${item.id} back to server");
      item.isModifiedLocally = false;
    }

    await _saveLocally();
    setState(() => _status = "All changes synced to server.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 3 - Q10: Data Pipeline")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Status: $_status", style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          if (_isLoading) const LinearProgressIndicator(),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.isModifiedLocally ? "Local Change (Pending Sync)" : "Synced"),
                  trailing: IconButton(icon: const Icon(Icons.edit), onPressed: () => _editItem(index)),
                );
              },
            ),
          ),
          ElevatedButton(onPressed: _fetchFromApi, child: const Text("Refetch from API")),
        ],
      ),
    );
  }
}
