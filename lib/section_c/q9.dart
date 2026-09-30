import 'package:flutter/material.dart';

class QuestionC9 extends StatelessWidget {
  const QuestionC9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive Settings')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 700) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildAccountSection()),
                Expanded(child: _buildAppSection()),
              ],
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildAccountSection(),
                  _buildAppSection(),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildAccountSection() {
    return _buildSection('Account Settings', [
      _buildSettingRow('Profile Name', 'John Doe'),
      _buildSettingRow('Email', 'john@example.com'),
      _buildSettingRow('Password', '********'),
    ]);
  }

  Widget _buildAppSection() {
    return _buildSection('App Preferences', [
      _buildSettingRow('Theme', 'Dark Mode'),
      _buildSettingRow('Notifications', 'Enabled'),
      _buildSettingRow('Language', 'English'),
    ]);
  }

  Widget _buildSection(String title, List<TableRow> rows) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue)),
          const SizedBox(height: 10),
          Table(
            border: TableBorder.symmetric(inside: const BorderSide(color: Colors.grey, width: 0.5)),
            children: rows,
          ),
        ],
      ),
    );
  }

  TableRow _buildSettingRow(String label, String value) {
    return TableRow(
      children: [
        Padding(padding: const EdgeInsets.all(12.0), child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500))),
        Padding(padding: const EdgeInsets.all(12.0), child: Text(value)),
      ],
    );
  }
}
