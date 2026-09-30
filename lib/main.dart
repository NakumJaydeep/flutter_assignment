import 'package:flutter/material.dart';
import 'solutions/q1.dart' as q1;
import 'solutions/q2.dart' as q2;
import 'solutions/q3.dart' as q3;
import 'solutions/q4.dart' as q4;
import 'solutions/q5.dart' as q5;
import 'solutions/q6.dart' as q6;
import 'solutions/q7.dart' as q7;
import 'solutions/q8.dart' as q8;
import 'solutions/q9.dart' as q9;
import 'solutions/q10.dart' as q10;
import 'solutions/q11.dart' as q11;
import 'solutions/q12.dart' as q12;
import 'solutions/q13.dart' as q13;
import 'solutions/q14.dart' as q14;
import 'solutions/q15.dart' as q15;
import 'solutions/q16.dart' as q16;
import 'solutions/q17.dart' as q17;
import 'solutions/q18.dart' as q18;
import 'solutions/q19.dart' as q19;
import 'solutions/q20.dart' as q20;
import 'solutions/q21.dart' as q21;
import 'solutions/q22.dart' as q22;
import 'solutions/q23.dart' as q23;
import 'solutions/q24.dart' as q24;
import 'solutions/q25.dart' as q25;
import 'solutions/q26.dart' as q26;
import 'solutions/q27.dart' as q27;
import 'solutions/q28.dart' as q28;
import 'solutions/q29.dart' as q29;
import 'solutions/q30.dart' as q30;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practical Assignment - Module 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void _runSolution(int qNum) async {
    debugPrint('\n--- EXECUTING SOLUTION FOR QUESTION $qNum ---');
    try {
      switch (qNum) {
        case 1: q1.main(); break;
        case 2: q2.main(); break;
        case 3: q3.main(); break;
        case 4: q4.main(); break;
        case 5: q5.main(); break;
        case 6: q6.main(); break;
        case 7: q7.main(); break;
        case 8: q8.main(); break;
        case 9: q9.main(); break;
        case 10: q10.main(); break;
        case 11: q11.main(); break;
        case 12: q12.main(); break;
        case 13: q13.main(); break;
        case 14: q14.main(); break;
        case 15: q15.main(); break;
        case 16: q16.main(); break;
        case 17: q17.main(); break;
        case 18: q18.main(); break;
        case 19: q19.main(); break;
        case 20: q20.main(); break;
        case 21: q21.main(); break;
        case 22: q22.main(); break;
        case 23: q23.main(); break;
        case 24: q24.main(); break;
        case 25: q25.main(); break;
        case 26: q26.main(); break;
        case 27: q27.main(); break;
        case 28: q28.main(); break;
        case 29: q29.main(); break;
        case 30: q30.main(); break;
      }
    } catch (e) {
      debugPrint('Error executing Q$qNum: $e');
    }
    debugPrint('--- QUESTION $qNum EXECUTION FINISHED ---\n');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Module 1 - 30 Programs'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 30,
        itemBuilder: (context, index) {
          final qNum = index + 1;
          return ElevatedButton(
            onPressed: () => _runSolution(qNum),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Text('Q$qNum'),
          );
        },
      ),
    );
  }
}
