import 'dart:convert';
import 'package:flutter/material.dart';

class Mark {
  final String subject;
  final int score;

  Mark({required this.subject, required this.score});

  Map<String, dynamic> toJson() => {'subject': subject, 'score': score};
  factory Mark.fromJson(Map<String, dynamic> json) => Mark(
        subject: json['subject'],
        score: json['score'],
      );
}

class Student {
  final String name;
  final List<Mark> marks;

  Student({required this.name, required this.marks});

  Map<String, dynamic> toJson() => {
        'name': name,
        'marks': marks.map((m) => m.toJson()).toList(),
      };

  factory Student.fromJson(Map<String, dynamic> json) {
    var marksList = json['marks'] as List;
    return Student(
      name: json['name'],
      marks: marksList.map((m) => Mark.fromJson(m)).toList(),
    );
  }
}

void main() => runApp(const MaterialApp(home: Q6Page()));

class Q6Page extends StatefulWidget {
  const Q6Page({super.key});
  @override
  State<Q6Page> createState() => _Q6PageState();
}

class _Q6PageState extends State<Q6Page> {
  String _result = "Click button to test nested JSON";

  void _testNestedJson() {
    Student s = Student(
      name: "Alice",
      marks: [
        Mark(subject: "Math", score: 95),
        Mark(subject: "Science", score: 88),
      ],
    );

    String encoded = jsonEncode(s.toJson());
    Student decoded = Student.fromJson(jsonDecode(encoded));

    setState(() {
      _result = "Encoded JSON:\n$encoded\n\nDecoded Student:\nName: ${decoded.name}\nMarks: ${decoded.marks.map((m) => '${m.subject}: ${m.score}').join(', ')}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 3 - Q6: Nested JSON")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(_result),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _testNestedJson, child: const Text("Test Nested Serialization")),
          ],
        ),
      ),
    );
  }
}
