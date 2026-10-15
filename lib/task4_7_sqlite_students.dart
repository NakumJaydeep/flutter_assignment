import 'package:flutter/material.dart';
import 'db_helper.dart';

class TaskSQLiteStudents extends StatefulWidget {
  const TaskSQLiteStudents({super.key});

  @override
  State<TaskSQLiteStudents> createState() => _TaskSQLiteStudentsState();
}

class _TaskSQLiteStudentsState extends State<TaskSQLiteStudents> {
  final DBHelper _dbHelper = DBHelper();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  List<Map<String, dynamic>> _students = [];

  @override
  void initState() {
    super.initState();
    _refreshStudents();
  }

  void _refreshStudents() async {
    final data = await _dbHelper.getStudents();
    setState(() {
      _students = data;
    });
  }

  Future<void> _addStudent() async {
    await _dbHelper.insertStudent({
      'name': _nameController.text,
      'age': int.parse(_ageController.text),
    });
    _nameController.clear();
    _ageController.clear();
    _refreshStudents();
  }

  Future<void> _updateStudent(int id) async {
    await _dbHelper.updateStudent({
      'id': id,
      'name': _nameController.text,
      'age': int.parse(_ageController.text),
    });
    _nameController.clear();
    _ageController.clear();
    _refreshStudents();
  }

  Future<void> _deleteStudent(int id) async {
    await _dbHelper.deleteStudent(id);
    _refreshStudents();
  }

  void _showForm(int? id) async {
    if (id != null) {
      final existingStudent = _students.firstWhere((element) => element['id'] == id);
      _nameController.text = existingStudent['name'];
      _ageController.text = existingStudent['age'].toString();
    } else {
      _nameController.clear();
      _ageController.clear();
    }

    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 120,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Age'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (id == null) {
                  await _addStudent();
                } else {
                  await _updateStudent(id);
                }
                Navigator.of(context).pop();
              },
              child: Text(id == null ? 'Create New' : 'Update'),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SQLite Students')),
      body: ListView.builder(
        itemCount: _students.length,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.all(15),
          child: ListTile(
            title: Text(_students[index]['name']),
            subtitle: Text("Age: ${_students[index]['age']}"),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _showForm(_students[index]['id']),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteStudent(_students[index]['id']),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}
