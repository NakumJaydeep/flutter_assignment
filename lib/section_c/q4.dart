import 'package:flutter/material.dart';

class TodoItem {
  final String title;
  bool isDone;
  TodoItem(this.title, {this.isDone = false});
}

class TodoListWidget extends StatefulWidget {
  final List<TodoItem> items;
  final Function(int) onToggle;
  final Function(int) onDelete;

  const TodoListWidget({
    super.key,
    required this.items,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  @override
  void didUpdateWidget(covariant TodoListWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Logic to handle updates if needed when the list changes from parent
    debugPrint('TodoListWidget didUpdateWidget called');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final item = widget.items[index];
        return ListTile(
          leading: Checkbox(
            value: item.isDone,
            onChanged: (_) => widget.onToggle(index),
          ),
          title: Text(
            item.title,
            style: TextStyle(
              decoration: item.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => widget.onDelete(index),
          ),
        );
      },
    );
  }
}

class QuestionC4 extends StatefulWidget {
  const QuestionC4({super.key});

  @override
  State<QuestionC4> createState() => _QuestionC4State();
}

class _QuestionC4State extends State<QuestionC4> {
  final List<TodoItem> _todos = [];
  final TextEditingController _controller = TextEditingController();

  void _addTodo() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _todos.add(TodoItem(_controller.text));
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(labelText: 'New Task'),
                  ),
                ),
                IconButton(icon: const Icon(Icons.add), onPressed: _addTodo),
              ],
            ),
          ),
          Expanded(
            child: TodoListWidget(
              items: _todos,
              onToggle: (index) => setState(() => _todos[index].isDone = !_todos[index].isDone),
              onDelete: (index) => setState(() => _todos.removeAt(index)),
            ),
          ),
        ],
      ),
    );
  }
}
