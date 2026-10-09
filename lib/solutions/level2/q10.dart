import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() => runApp(const MaterialApp(home: Q10Page()));

class Q10Page extends StatefulWidget {
  const Q10Page({super.key});
  @override
  State<Q10Page> createState() => _Q10PageState();
}

class _Q10PageState extends State<Q10Page> {
  final _controller = TextEditingController();
  List<String> _offlineQueue = [];
  String _connectionStatus = "Checking...";

  @override
  void initState() {
    super.initState();
    _loadQueue();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        _connectionStatus = result == ConnectivityResult.none ? "Offline" : "Online";
      });
      if (result != ConnectivityResult.none) {
        _syncQueue();
      }
    });
  }

  Future<void> _loadQueue() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _offlineQueue = prefs.getStringList('offline_form_queue') ?? [];
    });
  }

  Future<void> _submitForm() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      final prefs = await SharedPreferences.getInstance();
      _offlineQueue.add(_controller.text);
      await prefs.setStringList('offline_form_queue', _offlineQueue);
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Offline: Data saved to queue")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Online: Data sent to server")));
    }
    _controller.clear();
  }

  Future<void> _syncQueue() async {
    if (_offlineQueue.isEmpty) return;
    
    // Simulating background sync
    await Future.delayed(const Duration(seconds: 2));
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('offline_form_queue');
    setState(() {
      _offlineQueue.clear();
    });
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Sync Complete: All queued data sent!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 2 - Q10: Offline Queue")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Status: $_connectionStatus", style: TextStyle(fontWeight: FontWeight.bold, color: _connectionStatus == "Online" ? Colors.green : Colors.red)),
            const SizedBox(height: 10),
            TextField(controller: _controller, decoration: const InputDecoration(labelText: "Form Data")),
            ElevatedButton(onPressed: _submitForm, child: const Text("Submit Form")),
            const Divider(),
            Text("Items in Offline Queue: ${_offlineQueue.length}"),
            Expanded(
              child: ListView.builder(
                itemCount: _offlineQueue.length,
                itemBuilder: (context, index) => ListTile(title: Text(_offlineQueue[index])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
