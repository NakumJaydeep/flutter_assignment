import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

void main() => runApp(const MaterialApp(home: Q1Page()));

class Note {
  String id;
  String title;
  String content;

  Note({required this.id, required this.title, required this.content});

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'content': content};
  factory Note.fromJson(Map<String, dynamic> json) => Note(
    id: json['id'],
    title: json['title'],
    content: json['content'],
  );
}

class Q1Page extends StatefulWidget {
  const Q1Page({super.key});
  @override
  State<Q1Page> createState() => _Q1PageState();
}

class _Q1PageState extends State<Q1Page> {
  List<Note> _notes = [];
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<File> get _localFile async {
    final dir = await getApplicationDocumentsDirectory();
    return File(p.join(dir.path, 'notes_crud.json'));
  }

  Future<void> _loadNotes() async {
    try {
      final file = await _localFile;
      if (await file.exists()) {
        final content = await file.readAsString();
        final List<dynamic> jsonList = jsonDecode(content);
        setState(() {
          _notes = jsonList.map((j) => Note.fromJson(j)).toList();
        });
      }
    } catch (e) {
      print("Error loading notes: $e");
    }
  }

  Future<void> _saveNotes() async {
    final file = await _localFile;
    await file.writeAsString(jsonEncode(_notes.map((n) => n.toJson()).toList()));
  }

  void _addOrUpdateNote({Note? note}) {
    if (note != null) {
      _titleController.text = note.title;
      _contentController.text = note.content;
    } else {
      _titleController.clear();
      _contentController.clear();
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(note == null ? "Add Note" : "Edit Note"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _titleController, decoration: const InputDecoration(labelText: "Title")),
            TextField(controller: _contentController, decoration: const InputDecoration(labelText: "Content")),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (note == null) {
                  _notes.add(Note(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    title: _titleController.text,
                    content: _contentController.text,
                  ));
                } else {
                  note.title = _titleController.text;
                  note.content = _contentController.text;
                }
              });
              _saveNotes();
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void _deleteNote(String id) {
    setState(() {
      _notes.removeWhere((n) => n.id == id);
    });
    _saveNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 3 - Q1: Note CRUD")),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          final note = _notes[index];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.content),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: const Icon(Icons.edit), onPressed: () => _addOrUpdateNote(note: note)),
                IconButton(icon: const Icon(Icons.delete), onPressed: () => _deleteNote(note.id)),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addOrUpdateNote(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
