import 'package:flutter/material.dart';

class HardTask6 extends StatefulWidget {
  const HardTask6({super.key});

  @override
  State<HardTask6> createState() => _HardTask6State();
}

class _HardTask6State extends State<HardTask6> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _category = 'Work';
  bool _isImportant = false;

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SummaryScreen(
            name: _name,
            category: _category,
            isImportant: _isImportant,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hard 6: Complex Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Task Name'),
                validator: (val) => val == null || val.isEmpty ? 'Enter a name' : null,
                onSaved: (val) => _name = val ?? '',
              ),
              DropdownButtonFormField<String>(
                value: _category,
                decoration: const InputDecoration(labelText: 'Category'),
                items: ['Work', 'Personal', 'Shopping']
                    .map((label) => DropdownMenuItem(value: label, child: Text(label)))
                    .toList(),
                onChanged: (val) => setState(() => _category = val!),
              ),
              CheckboxListTile(
                title: const Text('Mark as Important'),
                value: _isImportant,
                onChanged: (val) => setState(() => _isImportant = val!),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _saveForm, child: const Text('Show Summary')),
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryScreen extends StatelessWidget {
  final String name;
  final String category;
  final bool isImportant;

  const SummaryScreen({super.key, required this.name, required this.category, required this.isImportant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Summary')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: $name'),
            Text('Category: $category'),
            Text('Important: ${isImportant ? "Yes" : "No"}'),
          ],
        ),
      ),
    );
  }
}
