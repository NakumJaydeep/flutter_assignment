import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class Student {
  final String name;
  final int age;
  Student({required this.name, required this.age});
  Map<String, dynamic> toJson() => {'name': name, 'age': age};
  factory Student.fromJson(Map<String, dynamic> json) => Student(name: json['name'], age: json['age']);
}

void main() => runApp(const MaterialApp(home: Q8Page()));

class Q8Page extends StatefulWidget {
  const Q8Page({super.key});
  @override
  State<Q8Page> createState() => _Q8PageState();
}

class _Q8PageState extends State<Q8Page> {
  List<Student> _students = [];

  Future<void> _saveStudents() async {
    final list = [Student(name: "John", age: 20), Student(name: "Jane", age: 22)];
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'students_list.json'));
    await file.writeAsString(jsonEncode(list.map((s) => s.toJson()).toList()));
    _loadStudents();
  }

  Future<void> _loadStudents() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'students_list.json'));
    if (await file.exists()) {
      final jsonList = jsonDecode(await file.readAsString()) as List;
      setState(() {
        _students = jsonList.map((j) => Student.fromJson(j)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 2 - Q8: List JSON File")),
      body: Column(
        children: [
          ElevatedButton(onPressed: _saveStudents, child: const Text("Save Sample List to File")),
          Expanded(
            child: ListView.builder(
              itemCount: _students.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_students[index].name),
                subtitle: Text("Age: ${_students[index].age}"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
