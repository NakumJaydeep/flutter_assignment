import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() => runApp(const MaterialApp(home: Q7Page()));

class Q7Page extends StatefulWidget {
  const Q7Page({super.key});
  @override
  State<Q7Page> createState() => _Q7PageState();
}

class _Q7PageState extends State<Q7Page> {
  final List<String> _localRecords = ["Record 1", "Record 2", "Record 3"];
  String _status = "Monitoring connection...";
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      if (result != ConnectivityResult.none) {
        _triggerSync();
      } else {
        setState(() => _status = "Offline: Waiting for connection to sync...");
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  Future<void> _triggerSync() async {
    if (_localRecords.isEmpty) return;

    setState(() => _status = "Online: Syncing ${_localRecords.length} records to server...");
    
    // Simulate server push
    await Future.delayed(const Duration(seconds: 3));
    
    setState(() {
      _localRecords.clear();
      _status = "Sync Complete: All records pushed to server.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 3 - Q7: Background Sync")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.sync, size: 50, color: Colors.blue),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(_status, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _localRecords.add("Manual Record ${DateTime.now().second}");
                  _status = "New record added. Will sync when online.";
                });
              },
              child: const Text("Add Offline Record"),
            ),
          ],
        ),
      ),
    );
  }
}
