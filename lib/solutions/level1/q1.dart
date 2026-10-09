import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() => runApp(const MaterialApp(home: Q1Page()));

class Q1Page extends StatefulWidget {
  const Q1Page({super.key});
  @override
  State<Q1Page> createState() => _Q1PageState();
}

class _Q1PageState extends State<Q1Page> {
  String _path = "Click button to see path";

  Future<void> _getPath() async {
    Directory dir = await getApplicationDocumentsDirectory();
    setState(() => _path = dir.path);
    print("Application Documents Directory: ${dir.path}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 1 - Q1")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_path, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _getPath, child: const Text("Get Path")),
          ],
        ),
      ),
    );
  }
}
