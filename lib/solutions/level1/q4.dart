import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

void main() => runApp(const MaterialApp(home: Q4Page()));

class Q4Page extends StatefulWidget {
  const Q4Page({super.key});
  @override
  State<Q4Page> createState() => _Q4PageState();
}

class _Q4PageState extends State<Q4Page> {
  String _status = "Check if file exists";

  Future<void> _checkAndRead() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'level1_q4.txt'));
    
    if (await file.exists()) {
      String content = await file.readAsString();
      setState(() => _status = "File exists. Content: $content");
    } else {
      setState(() => _status = "File does not exist. Creating one now...");
      await file.writeAsString("New file content created at ${DateTime.now()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 1 - Q4")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_status, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _checkAndRead, child: const Text("Check exists() & Read")),
          ],
        ),
      ),
    );
  }
}
