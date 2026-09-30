import 'package:flutter/material.dart';

class QuestionB9 extends StatelessWidget {
  const QuestionB9({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isWide = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(title: const Text('Responsive Form')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (isWide)
              Row(
                children: [
                  Expanded(child: _buildTextField('First Name')),
                  const SizedBox(width: 16),
                  Expanded(child: _buildTextField('Last Name')),
                ],
              )
            else ...[
              _buildTextField('First Name'),
              const SizedBox(height: 16),
              _buildTextField('Last Name'),
            ],
            const SizedBox(height: 16),
            _buildTextField('Email'),
            const SizedBox(height: 16),
            if (isWide)
              Row(
                children: [
                  Expanded(child: _buildTextField('City')),
                  const SizedBox(width: 16),
                  Expanded(child: _buildTextField('Country')),
                ],
              )
            else ...[
              _buildTextField('City'),
              const SizedBox(height: 16),
              _buildTextField('Country'),
            ],
            const SizedBox(height: 24),
            ElevatedButton(onPressed: () {}, child: const Text('Submit')),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
