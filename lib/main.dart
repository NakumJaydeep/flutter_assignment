import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'task1_shared_prefs_username.dart';
import 'task2_dark_mode.dart';
import 'task3_sqlite_products.dart';
import 'task4_7_sqlite_students.dart';
import 'task8_hive_todo.dart';
import 'task9_hive_user.dart';
import 'task10_file_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Module V Assignment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AssignmentMenu(),
    );
  }
}

class AssignmentMenu extends StatelessWidget {
  const AssignmentMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Module V: Data Persistence")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _menuItem(context, "Task 1: Shared Prefs - Username", const Task1Username()),
          _menuItem(context, "Task 2: Shared Prefs - Dark Mode", const Task2DarkMode()),
          _menuItem(context, "Task 3: SQLite - Products Table", const Task3SqliteProducts()),
          _menuItem(context, "Tasks 4-7: SQLite - Students (CRUD)", const TaskSQLiteStudents()),
          _menuItem(context, "Task 8: Hive - To-Do Note", const Task8HiveTodo()),
          _menuItem(context, "Task 9: Hive - User Name & Age", const Task9HiveUser()),
          _menuItem(context, "Task 10: File Storage (path_provider)", const Task10FileStorage()),
        ],
      ),
    );
  }

  Widget _menuItem(BuildContext context, String title, Widget page) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page)),
      ),
    );
  }
}
