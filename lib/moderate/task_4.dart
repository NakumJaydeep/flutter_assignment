import 'package:flutter/material.dart';

class ModerateTask4 extends StatefulWidget {
  const ModerateTask4({super.key});

  @override
  State<ModerateTask4> createState() => _ModerateTask4State();
}

class _ModerateTask4State extends State<ModerateTask4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Moderate 4: Return Data')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DataReturnScreen()),
            );

            if (result != null && mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Received: $result')),
              );
            }
          },
          child: const Text('Go to Selection Screen'),
        ),
      ),
    );
  }
}

class DataReturnScreen extends StatelessWidget {
  const DataReturnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select an Option')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context, 'Option A'),
              child: const Text('Option A'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, 'Option B'),
              child: const Text('Option B'),
            ),
          ],
        ),
      ),
    );
  }
}
