import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

void main() => runApp(const MaterialApp(home: Q3Page()));

class Q3Page extends StatefulWidget {
  const Q3Page({super.key});
  @override
  State<Q3Page> createState() => _Q3PageState();
}

class _Q3PageState extends State<Q3Page> {
  String _fileContent = "Click button to read file";

  Future<void> _readFile() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File(p.join(dir.path, 'hello.txt'));
      // Creating file if it doesn't exist for the purpose of the demo
      if (!await file.exists()) {
        await file.writeAsString("Content from file!");
      }
      String content = await file.readAsString();
      setState(() => _fileContent = content);
    } catch (e) {
      setState(() => _fileContent = "Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 1 - Q3")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("File Content:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(_fileContent),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _readFile, child: const Text("Read hello.txt")),
          ],
        ),
      ),
    );
  }
}
