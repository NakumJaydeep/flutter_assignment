import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

void main() => runApp(const MaterialApp(home: Q5Page()));

class Q5Page extends StatefulWidget {
  const Q5Page({super.key});
  @override
  State<Q5Page> createState() => _Q5PageState();
}

class _Q5PageState extends State<Q5Page> {
  String _status = "File not deleted yet";

  Future<void> _deleteFile() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'hello.txt'));
    
    if (await file.exists()) {
      await file.delete();
      setState(() => _status = "File deleted successfully.");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("File 'hello.txt' has been deleted!")),
        );
      }
    } else {
      setState(() => _status = "File does not exist, nothing to delete.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 1 - Q5")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_status),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _deleteFile, child: const Text("Delete hello.txt")),
          ],
        ),
      ),
    );
  }
}
