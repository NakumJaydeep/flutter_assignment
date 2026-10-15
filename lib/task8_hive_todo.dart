import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Task8HiveTodo extends StatefulWidget {
  const Task8HiveTodo({super.key});

  @override
  State<Task8HiveTodo> createState() => _Task8HiveTodoState();
}

class _Task8HiveTodoState extends State<Task8HiveTodo> {
  final TextEditingController _controller = TextEditingController();
  late Box _todoBox;
  bool _isBoxOpen = false;

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    _todoBox = await Hive.openBox('todoBox');
    setState(() {
      _isBoxOpen = true;
    });
  }

  void _addNote() {
    if (_controller.text.isNotEmpty) {
      _todoBox.add(_controller.text);
      _controller.clear();
      // No need for setState because ValueListenableBuilder handles it
    }
  }

  void _deleteNote(int index) {
    _todoBox.deleteAt(index);
    // No need for setState because ValueListenableBuilder handles it
  }

  @override
  Widget build(BuildContext context) {
    if (!_isBoxOpen) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    return Scaffold(
      appBar: AppBar(title: const Text("Task 8: Hive To-Do Note")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Enter a note'),
                  ),
                ),
                IconButton(onPressed: _addNote, icon: const Icon(Icons.add))
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: Hive.box('todoBox').listenable(),
              builder: (context, Box box, _) {
                return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final note = box.getAt(index);
                    return ListTile(
                      title: Text(note),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteNote(index),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
