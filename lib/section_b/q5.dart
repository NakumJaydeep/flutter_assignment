import 'package:flutter/material.dart';

class QuestionB5 extends StatefulWidget {
  const QuestionB5({super.key});

  @override
  State<QuestionB5> createState() => _QuestionB5State();
}

class _QuestionB5State extends State<QuestionB5> {
  final List<String> _tags = ['Flutter', 'Dart', 'React', 'Vue', 'Angular', 'Python', 'Java', 'Kotlin', 'Swift'];
  final List<String> _selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skill Selector')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: _tags.map((tag) {
            final isSelected = _selectedTags.contains(tag);
            return FilterChip(
              label: Text(tag),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedTags.add(tag);
                  } else {
                    _selectedTags.remove(tag);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
