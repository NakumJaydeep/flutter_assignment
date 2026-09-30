import 'package:flutter/material.dart';

import 'section_a/q1.dart';
import 'section_a/q2.dart';
import 'section_a/q3.dart';
import 'section_a/q4.dart';
import 'section_a/q5.dart';
import 'section_a/q6.dart';
import 'section_a/q7.dart';
import 'section_a/q8.dart';
import 'section_a/q9.dart';
import 'section_a/q10.dart';

import 'section_b/q1.dart';
import 'section_b/q2.dart';
import 'section_b/q3.dart';
import 'section_b/q4.dart';
import 'section_b/q5.dart';
import 'section_b/q6.dart';
import 'section_b/q7.dart';
import 'section_b/q8.dart';
import 'section_b/q9.dart';
import 'section_b/q10.dart';

import 'section_c/q1.dart';
import 'section_c/q2.dart';
import 'section_c/q3.dart';
import 'section_c/q4.dart';
import 'section_c/q5.dart';
import 'section_c/q6.dart';
import 'section_c/q7.dart';
import 'section_c/q8.dart';
import 'section_c/q9.dart';
import 'section_c/q10.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignment 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practical Questions'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: ListView(
        children: [
          _buildSection(context, 'Section A - Easy Level', [
            _tile(context, 'Q1: Stateless Widget', const Question1()),
            _tile(context, 'Q2: Counter App', const Question2()),
            _tile(context, 'Q3: Scaffold & FAB', const Question3()),
            _tile(context, 'Q4: ListView.builder', const Question4()),
            _tile(context, 'Q5: GridView.count', const Question5()),
            _tile(context, 'Q6: Card Widget', const Question6()),
            _tile(context, 'Q7: Drawer', const Question7()),
            _tile(context, 'Q8: BottomNavigationBar', const Question8()),
            _tile(context, 'Q9: Stack & Container', const Question9()),
            _tile(context, 'Q10: Custom SectionTitle', const Question10()),
          ]),
          _buildSection(context, 'Section B - Moderate Level', [
            _tile(context, 'Q1: Lifecycle Demo', const QuestionB1()),
            _tile(context, 'Q2: LayoutBuilder Responsive', const QuestionB2()),
            _tile(context, 'Q3: GridView.builder Product', const QuestionB3()),
            _tile(context, 'Q4: Custom ProfileCard', const QuestionB4()),
            _tile(context, 'Q5: Wrap Widget Skills', const QuestionB5()),
            _tile(context, 'Q6: Badge Icon (Stack)', const QuestionB6()),
            _tile(context, 'Q7: TabBar & TabBarView', const QuestionB7()),
            _tile(context, 'Q8: Table Widget Settings', const QuestionB8()),
            _tile(context, 'Q9: MediaQuery Responsive Form', const QuestionB9()),
            _tile(context, 'Q10: AspectRatio Media Card', const QuestionB10()),
          ]),
          _buildSection(context, 'Section C - Hard Level', [
            _tile(context, 'Q1: Responsive Dashboard', const QuestionC1()),
            _tile(context, 'Q2: Custom Widget Library', const QuestionC2()),
            _tile(context, 'Q3: E-commerce Stack/Wrap', const QuestionC3()),
            _tile(context, 'Q4: To-Do List (setState)', const QuestionC4()),
            _tile(context, 'Q5: Navigation Shell', const QuestionC5()),
            _tile(context, 'Q6: Multi-tab Profile', const QuestionC6()),
            _tile(context, 'Q7: News Feed (IntrinsicHeight)', const QuestionC7()),
            _tile(context, 'Q8: Circular Avatar Overlap', const QuestionC8()),
            _tile(context, 'Q9: Grouped Table Settings', const QuestionC9()),
            _tile(context, 'Q10: Lifecycle Logger Utility', const QuestionC10()),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> children) {
    return ExpansionTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      children: children,
    );
  }

  Widget _tile(BuildContext context, String title, Widget page) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
    );
  }
}
