import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// Manual Adapter to avoid build_runner requirement for simplicity
class Todo {
  String task;
  bool isDone;
  bool isSynced;

  Todo({required this.task, this.isDone = false, this.isSynced = false});

  Map<String, dynamic> toMap() => {'task': task, 'isDone': isDone, 'isSynced': isSynced};
  factory Todo.fromMap(Map<dynamic, dynamic> map) => Todo(
    task: map['task'],
    isDone: map['isDone'],
    isSynced: map['isSynced'],
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('todo_box');
  runApp(const MaterialApp(home: Q3Page()));
}

class Q3Page extends StatefulWidget {
  const Q3Page({super.key});
  @override
  State<Q3Page> createState() => _Q3PageState();
}

class _Q3PageState extends State<Q3Page> {
  final _box = Hive.box('todo_box');
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Connectivity().onConnectivityChanged.listen((result) {
      if (result != ConnectivityResult.none) {
        _syncWithMockApi();
      }
    });
  }

  void _addTodo() {
    if (_controller.text.isEmpty) return;
    final todo = Todo(task: _controller.text);
    _box.add(todo.toMap());
    _controller.clear();
    setState(() {});
  }

  Future<void> _syncWithMockApi() async {
    // Simulating API sync for unsynced items
    for (int i = 0; i < _box.length; i++) {
      var map = Map<String, dynamic>.from(_box.getAt(i));
      var todo = Todo.fromMap(map);
      if (!todo.isSynced) {
        print("Syncing task: ${todo.task}");
        await Future.delayed(const Duration(milliseconds: 500));
        todo.isSynced = true;
        _box.putAt(i, todo.toMap());
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 3 - Q3: Hive Offline-first")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(child: TextField(controller: _controller, decoration: const InputDecoration(hintText: "New task"))),
                IconButton(icon: const Icon(Icons.add), onPressed: _addTodo),
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _box.listenable(),
              builder: (context, Box box, _) {
                return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final todo = Todo.fromMap(box.getAt(index));
                    return ListTile(
                      title: Text(todo.task),
                      subtitle: Text(todo.isSynced ? "Synced to Cloud" : "Local only"),
                      trailing: Checkbox(
                        value: todo.isDone,
                        onChanged: (val) {
                          todo.isDone = val!;
                          box.putAt(index, todo.toMap());
                          setState(() {});
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
