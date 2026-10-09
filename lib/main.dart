import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Level 1 Imports
import 'solutions/level1/q1.dart' as l1q1;
import 'solutions/level1/q2.dart' as l1q2;
import 'solutions/level1/q3.dart' as l1q3;
import 'solutions/level1/q4.dart' as l1q4;
import 'solutions/level1/q5.dart' as l1q5;
import 'solutions/level1/q6.dart' as l1q6;
import 'solutions/level1/q7.dart' as l1q7;
import 'solutions/level1/q8.dart' as l1q8;
import 'solutions/level1/q9.dart' as l1q9;
import 'solutions/level1/q10.dart' as l1q10;

// Level 2 Imports
import 'solutions/level2/q1.dart' as l2q1;
import 'solutions/level2/q2.dart' as l2q2;
import 'solutions/level2/q3.dart' as l2q3;
import 'solutions/level2/q4.dart' as l2q4;
import 'solutions/level2/q5.dart' as l2q5;
import 'solutions/level2/q6.dart' as l2q6;
import 'solutions/level2/q7.dart' as l2q7;
import 'solutions/level2/q8.dart' as l2q8;
import 'solutions/level2/q9.dart' as l2q9;
import 'solutions/level2/q10.dart' as l2q10;

// Level 3 Imports
import 'solutions/level3/q1.dart' as l3q1;
import 'solutions/level3/q2.dart' as l3q2;
import 'solutions/level3/q3.dart' as l3q3;
import 'solutions/level3/q4.dart' as l3q4;
import 'solutions/level3/q5.dart' as l3q5;
import 'solutions/level3/q6.dart' as l3q6;
import 'solutions/level3/q7.dart' as l3q7;
import 'solutions/level3/q8.dart' as l3q8;
import 'solutions/level3/q9.dart' as l3q9;
import 'solutions/level3/q10.dart' as l3q10;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive for solutions that use it (like Level 3 Q3)
  await Hive.initFlutter();
  await Hive.openBox('todo_box'); 
  
  runApp(const AssignmentApp());
}

class AssignmentApp extends StatelessWidget {
  const AssignmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Module IV Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment Dashboard"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildLevelSection(context, "Level 1: Easy", [
            _btn(context, "Q1: getDocsDir", const l1q1.Q1Page()),
            _btn(context, "Q2: writeAsString", const l1q2.Q2Page()),
            _btn(context, "Q3: read + Text", const l1q3.Q3Page()),
            _btn(context, "Q4: exists() check", const l1q4.Q4Page()),
            _btn(context, "Q5: delete() + Msg", const l1q5.Q5Page()),
            _btn(context, "Q6: SP String", const l1q6.Q6Page()),
            _btn(context, "Q7: SP Counter", const l1q7.Q7Page()),
            _btn(context, "Q8: Map Cache", const l1q8.Q8Page()),
            _btn(context, "Q9: jsonEncode", const l1q9.Q9Page()),
            _btn(context, "Q10: jsonDecode", const l1q10.Q10Page()),
          ]),
          _buildLevelSection(context, "Level 2: Moderate", [
            _btn(context, "Q1: Notes App (File)", const l2q1.Q1Page()),
            _btn(context, "Q2: Student JSON", const l2q2.Q2Page()),
            _btn(context, "Q3: SP ListView", const l2q3.Q3Page()),
            _btn(context, "Q4: Cache-first Loader", const l2q4.Q4Page()),
            _btn(context, "Q5: Clear Cache", const l2q5.Q5Page()),
            _btn(context, "Q6: Theme Pref", const l2q6.Q6App()),
            _btn(context, "Q7: Append File", const l2q7.Q7Page()),
            _btn(context, "Q8: Students File", const l2q8.Q8Page()),
            _btn(context, "Q9: Gallery Image Copy", const l2q9.Q9Page()),
            _btn(context, "Q10: Offline Queue", const l2q10.Q10Page()),
          ]),
          _buildLevelSection(context, "Level 3: Hard", [
            _btn(context, "Q1: Notes CRUD", const l3q1.Q1Page()),
            _btn(context, "Q2: Image Cache", const l3q2.Q2Page()),
            _btn(context, "Q3: Hive To-Do", const l3q3.Q3Page()),
            _btn(context, "Q4: Generic Repo", const l3q4.Q4Page()),
            _btn(context, "Q5: Expiry Cache", const l3q5.Q5Page()),
            _btn(context, "Q6: Nested JSON", const l3q6.Q6Page()),
            _btn(context, "Q7: Background Sync", const l3q7.Q7Page()),
            _btn(context, "Q8: Log & Share", const l3q8.Q8Page()),
            _btn(context, "Q9: API Fallback", const l3q9.Q9Page()),
            _btn(context, "Q10: Data Pipeline", const l3q10.Q10Page()),
          ]),
        ],
      ),
    );
  }

  Widget _buildLevelSection(BuildContext context, String title, List<Widget> buttons) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo)),
        ),
        Wrap(spacing: 8, runSpacing: 8, children: buttons),
        const Divider(height: 40),
      ],
    );
  }

  Widget _btn(BuildContext context, String label, Widget page) {
    return ActionChip(
      backgroundColor: Colors.indigo.shade50,
      label: Text(label),
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
    );
  }
}
