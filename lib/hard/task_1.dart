import 'package:flutter/material.dart';

class HardTask1 extends StatefulWidget {
  const HardTask1({super.key});

  @override
  State<HardTask1> createState() => _HardTask1State();
}

class _HardTask1State extends State<HardTask1> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _address = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hard 1: Multi-step Form')),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 2) {
            setState(() => _currentStep++);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Form Submitted')),
            );
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() => _currentStep--);
          }
        },
        steps: [
          Step(
            title: const Text('Personal Info'),
            content: TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              onChanged: (val) => _name = val,
            ),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: const Text('Address'),
            content: TextFormField(
              decoration: const InputDecoration(labelText: 'Address'),
              onChanged: (val) => _address = val,
            ),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: const Text('Review'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: $_name'),
                Text('Address: $_address'),
              ],
            ),
            isActive: _currentStep >= 2,
          ),
        ],
      ),
    );
  }
}
