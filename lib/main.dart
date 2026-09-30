import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as provider_pkg;

// Easy Level Tasks
import 'easy/task_1.dart';
import 'easy/task_2.dart';
import 'easy/task_3.dart';
import 'easy/task_4.dart';
import 'easy/task_5.dart';
import 'easy/task_6.dart';
import 'easy/task_7.dart';
import 'easy/task_8.dart';
import 'easy/task_9.dart';
import 'easy/task_10.dart';

// Moderate Level Tasks
import 'moderate/task_1.dart';
import 'moderate/task_2.dart';
import 'moderate/task_3.dart';
import 'moderate/task_4.dart';
import 'moderate/task_5.dart';
import 'moderate/task_6.dart';
import 'moderate/task_7.dart';
import 'moderate/task_8.dart';
import 'moderate/task_9.dart';
import 'moderate/task_10.dart';

// Hard Level Tasks
import 'hard/task_1.dart';
import 'hard/task_2.dart';
import 'hard/task_3.dart';
import 'hard/task_4.dart';
import 'hard/task_5.dart';
import 'hard/task_6.dart';
import 'hard/task_7.dart';
import 'hard/task_8.dart';
import 'hard/task_9.dart';
import 'hard/task_10.dart';

// Global Provider for Hard Task 7 (Theme Switcher)
class GlobalThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

void main() {
  runApp(
    // ProviderScope is required for Riverpod tasks (Hard Task 3)
    const ProviderScope(
      child: MyAppWrapper(),
    ),
  );
}

class MyAppWrapper extends StatelessWidget {
  const MyAppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // provider_pkg is used for Provider-based tasks (Moderate 8, Hard 2, Hard 7, Hard 10)
    return provider_pkg.ChangeNotifierProvider(
      create: (_) => GlobalThemeProvider(),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = provider_pkg.Provider.of<GlobalThemeProvider>(context);

    return MaterialApp(
      title: 'Practical Assignment - Module III',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      // Named routes for Easy Task 5
      routes: {
        '/about': (context) => const AboutScreen(),
        '/contact': (context) => const ContactScreen(),
      },
      home: const AssignmentDashboard(),
    );
  }
}

class AssignmentDashboard extends StatelessWidget {
  const AssignmentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment Dashboard'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildHeader('Easy Level (10 Practicals)', Colors.green.shade700),
          _buildItem(context, 'Task 1: ListView.builder (Names)', const EasyTask1()),
          _buildItem(context, 'Task 2: ListTile with Icon', const EasyTask2()),
          _buildItem(context, 'Task 3: GridView.builder (Colors)', const EasyTask3()),
          _buildItem(context, 'Task 4: Simple Navigation (Push/Pop)', const EasyTask4()),
          _buildItem(context, 'Task 5: Named Routes (Home/About/Contact)', const EasyTask5()),
          _buildItem(context, 'Task 6: Simple Form (Validation)', const EasyTask6()),
          _buildItem(context, 'Task 7: Counter App (setState)', const EasyTask7()),
          _buildItem(context, 'Task 8: Checkbox Toggle', const EasyTask8()),
          _buildItem(context, 'Task 9: ChangeNotifier & Consumer', const EasyTask9()),
          _buildItem(context, 'Task 10: Provider: read() vs watch()', const EasyTask10()),

          _buildHeader('Moderate Level (10 Practicals)', Colors.orange.shade800),
          _buildItem(context, 'Task 1: Product Catalog Grid', const ModerateTask1()),
          _buildItem(context, 'Task 2: List Filter Search', const ModerateTask2()),
          _buildItem(context, 'Task 3: Pass Data Navigation', const ModerateTask3()),
          _buildItem(context, 'Task 4: Return Data (SnackBar)', const ModerateTask4()),
          _buildItem(context, 'Task 5: Registration Form (Regex)', const ModerateTask5()),
          _buildItem(context, 'Task 6: Login Form Navigation', const ModerateTask6()),
          _buildItem(context, 'Task 7: To-Do List (setState)', const ModerateTask7()),
          _buildItem(context, 'Task 8: Shopping Cart (Provider)', const ModerateTask8()),
          _buildItem(context, 'Task 9: Star Rating Widget', const ModerateTask9()),
          _buildItem(context, 'Task 10: Star Pattern Generator', const ModerateTask10()),

          _buildHeader('Hard Level (10 Practicals)', Colors.red.shade900),
          _buildItem(context, 'Task 1: Multi-step Form Wizard', const HardTask1()),
          _buildItem(context, 'Task 2: E-commerce App (Provider)', const HardTask2()),
          _buildItem(context, 'Task 3: Todo App (Riverpod)', const HardTask3()),
          _buildItem(context, 'Task 4: Counter App (BLoC)', const HardTask4()),
          _buildItem(context, 'Task 5: Toggle List/Grid View', const HardTask5()),
          _buildItem(context, 'Task 6: Complex Form Validation', const HardTask6()),
          _buildItem(context, 'Task 7: Theme Switcher', const HardTask7()),
          _buildItem(context, 'Task 8: Number Pyramid Generator', const HardTask8()),
          _buildItem(context, 'Task 9: Nested Bottom Navigation', const HardTask9()),
          _buildItem(context, 'Task 10: Multi-user Login System', const HardTask10()),
        ],
      ),
    );
  }

  Widget _buildHeader(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      color: color,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _buildItem(BuildContext context, String title, Widget target) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => target)),
    );
  }
}
