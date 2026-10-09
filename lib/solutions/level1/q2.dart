import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

void main() => runApp(const MaterialApp(home: Q2Page()));

class Q2Page extends StatefulWidget {
  const Q2Page({super.key});
  @override
  State<Q2Page> createState() => _Q2PageState();
}

class _Q2PageState extends State<Q2Page> {
  String _status = "Not written yet";

  Future<void> _writeFile() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'hello.txt'));
    await file.writeAsString("Hello Flutter");
    setState(() => _status = "File written to: ${file.path}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 1 - Q2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_status, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _writeFile, child: const Text("Write 'Hello Flutter' to File")),
          ],
        ),
      ),
    );
  }
}
