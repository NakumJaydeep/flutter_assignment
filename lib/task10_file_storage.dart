import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Task10FileStorage extends StatefulWidget {
  const Task10FileStorage({super.key});

  @override
  State<Task10FileStorage> createState() => _Task10FileStorageState();
}

class _Task10FileStorageState extends State<Task10FileStorage> {
  final TextEditingController _controller = TextEditingController();
  String _fileContent = "No data read from file";

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.txt');
  }

  Future<void> _writeToFile() async {
    final file = await _localFile;
    await file.writeAsString(_controller.text);
    _controller.clear();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Saved to file!")));
  }

  Future<void> _readFromFile() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      setState(() {
        _fileContent = contents;
      });
    } catch (e) {
      setState(() {
        _fileContent = "Error reading file or file doesn't exist.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 10: File Storage")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: "Enter text to save"),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _writeToFile, child: const Text("Write to File")),
                ElevatedButton(onPressed: _readFromFile, child: const Text("Read from File")),
              ],
            ),
            const SizedBox(height: 20),
            const Text("File Contents:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(_fileContent),
          ],
        ),
      ),
    );
  }
}
