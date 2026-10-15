import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Task9HiveUser extends StatefulWidget {
  const Task9HiveUser({super.key});

  @override
  State<Task9HiveUser> createState() => _Task9HiveUserState();
}

class _Task9HiveUserState extends State<Task9HiveUser> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  late Box _userBox;
  bool _isBoxOpen = false;

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    _userBox = await Hive.openBox('userBox');
    setState(() {
      _isBoxOpen = true;
    });
  }

  void _saveUser() {
    _userBox.put('name', _nameController.text);
    _userBox.put('age', _ageController.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!_isBoxOpen) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    String name = _userBox.get('name') ?? "No Name";
    String age = _userBox.get('age') ?? "No Age";

    return Scaffold(
      appBar: AppBar(title: const Text("Task 9: Hive User Name & Age")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Saved User: $name, Age: $age", style: const TextStyle(fontSize: 18)),
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: "Name")),
            TextField(controller: _ageController, decoration: const InputDecoration(labelText: "Age"), keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _saveUser, child: const Text("Save User")),
          ],
        ),
      ),
    );
  }
}
