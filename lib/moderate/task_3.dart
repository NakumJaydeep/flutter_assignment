import 'package:flutter/material.dart';

class Student {
  final String name;
  final int rollNo;
  final double marks;

  Student(this.name, this.rollNo, this.marks);
}

class ModerateTask3 extends StatelessWidget {
  const ModerateTask3({super.key});

  @override
  Widget build(BuildContext context) {
    final student = Student('John Doe', 101, 85.5);

    return Scaffold(
      appBar: AppBar(title: const Text('Moderate 3: Pass Data')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(student: student),
              ),
            );
          },
          child: const Text('View Student Details'),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Student student;
  const DetailScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${student.name}', style: const TextStyle(fontSize: 20)),
            Text('Roll No: ${student.rollNo}', style: const TextStyle(fontSize: 20)),
            Text('Marks: ${student.marks}', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
