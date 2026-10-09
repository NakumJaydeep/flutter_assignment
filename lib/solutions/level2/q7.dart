import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

void main() => runApp(const MaterialApp(home: Q7Page()));

class Q7Page extends StatefulWidget {
  const Q7Page({super.key});
  @override
  State<Q7Page> createState() => _Q7PageState();
}

class _Q7PageState extends State<Q7Page> {
  final _controller = TextEditingController();
  String _fileContent = "";

  Future<void> _appendText() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'append_test.txt'));
    
    // FileMode.append ensures text is added to the end
    await file.writeAsString("${_controller.text}\n", mode: FileMode.append);
    _controller.clear();
    _readFile();
  }

  Future<void> _readFile() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'append_test.txt'));
    if (await file.exists()) {
      String content = await file.readAsString();
      setState(() => _fileContent = content);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 2 - Q7: Append to File")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _controller, decoration: const InputDecoration(labelText: "Text to append")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: _appendText, child: const Text("Append to File")),
            const Divider(),
            const Text("File Content:", style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(child: SingleChildScrollView(child: Text(_fileContent))),
          ],
        ),
      ),
    );
  }
}
