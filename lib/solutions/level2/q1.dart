import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

void main() => runApp(const MaterialApp(home: Q1Page()));

class Q1Page extends StatefulWidget {
  const Q1Page({super.key});
  @override
  State<Q1Page> createState() => _Q1PageState();
}

class _Q1PageState extends State<Q1Page> {
  final _controller = TextEditingController();
  String _savedNote = "";

  @override
  void initState() {
    super.initState();
    _loadNote();
  }

  Future<File> get _localFile async {
    final dir = await getApplicationDocumentsDirectory();
    return File(p.join(dir.path, 'user_note.txt'));
  }

  Future<void> _loadNote() async {
    try {
      final file = await _localFile;
      if (await file.exists()) {
        String content = await file.readAsString();
        setState(() => _savedNote = content);
      }
    } catch (e) {
      print("Error loading note: $e");
    }
  }

  Future<void> _saveNote() async {
    final file = await _localFile;
    await file.writeAsString(_controller.text);
    setState(() => _savedNote = _controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 2 - Q1: Notes App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: "Type your note here", border: OutlineInputBorder()),
              maxLines: 3,
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: _saveNote, child: const Text("Save Note")),
            const Divider(height: 30),
            const Text("Last Saved Note:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Text(_savedNote.isEmpty ? "No note saved yet" : _savedNote),
            ),
          ],
        ),
      ),
    );
  }
}
