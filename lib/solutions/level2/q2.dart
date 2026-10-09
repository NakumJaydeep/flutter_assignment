import 'dart:convert';
import 'package:flutter/material.dart';

class Student {
  final String name;
  final int age;

  Student({required this.name, required this.age});

  Map<String, dynamic> toJson() => {'name': name, 'age': age};
  factory Student.fromJson(Map<String, dynamic> json) => Student(name: json['name'], age: json['age']);
}

void main() => runApp(const MaterialApp(home: Q2Page()));

class Q2Page extends StatefulWidget {
  const Q2Page({super.key});
  @override
  State<Q2Page> createState() => _Q2PageState();
}

class _Q2PageState extends State<Q2Page> {
  String _result = "Test conversion by clicking buttons";

  void _testToJson() {
    Student s = Student(name: "Alice", age: 22);
    String jsonStr = jsonEncode(s.toJson());
    setState(() => _result = "Object to JSON: $jsonStr");
  }

  void _testFromJson() {
    String jsonStr = '{"name": "Bob", "age": 25}';
    Student s = Student.fromJson(jsonDecode(jsonStr));
    setState(() => _result = "JSON to Object: Name: ${s.name}, Age: ${s.age}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 2 - Q2: Student Model")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_result, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _testToJson, child: const Text("Student -> JSON")),
            ElevatedButton(onPressed: _testFromJson, child: const Text("JSON -> Student")),
          ],
        ),
      ),
    );
  }
}
