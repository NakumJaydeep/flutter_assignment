import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:share_plus/share_plus.dart';

void main() => runApp(const MaterialApp(home: Q8Page()));

class Q8Page extends StatefulWidget {
  const Q8Page({super.key});
  @override
  State<Q8Page> createState() => _Q8PageState();
}

class _Q8PageState extends State<Q8Page> {
  String _logContent = "";

  Future<File> get _logFile async {
    final dir = await getApplicationDocumentsDirectory();
    return File(p.join(dir.path, 'app_logs.txt'));
  }

  Future<void> _addLog(String message) async {
    final file = await _logFile;
    final timestamp = DateTime.now().toString();
    await file.writeAsString("[$timestamp] $message\n", mode: FileMode.append);
    _readLogs();
  }

  Future<void> _readLogs() async {
    final file = await _logFile;
    if (await file.exists()) {
      final content = await file.readAsString();
      setState(() => _logContent = content);
    }
  }

  Future<void> _shareLog() async {
    final file = await _logFile;
    if (await file.exists()) {
      await Share.shareXFiles([XFile(file.path)], text: 'App Logs');
    }
  }

  @override
  void initState() {
    super.initState();
    _readLogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 3 - Q8: Logging & Share")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ElevatedButton(onPressed: () => _addLog("User Action: Clicked Log Button"), child: const Text("Log Action")),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: _shareLog, child: const Text("Export/Share Logs")),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Text(_logContent, style: const TextStyle(fontFamily: 'monospace')),
            ),
          ),
        ],
      ),
    );
  }
}
