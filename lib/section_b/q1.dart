import 'package:flutter/material.dart';

class QuestionB1 extends StatefulWidget {
  const QuestionB1({super.key});

  @override
  State<QuestionB1> createState() {
    print('Lifecycle: createState');
    return _QuestionB1State();
  }
}

class _QuestionB1State extends State<QuestionB1> {
  @override
  void initState() {
    super.initState();
    print('Lifecycle: initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('Lifecycle: didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant QuestionB1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('Lifecycle: didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
    print('Lifecycle: build');
    return Scaffold(
      appBar: AppBar(title: const Text('Lifecycle Demo')),
      body: const Center(child: Text('Check console for lifecycle logs')),
    );
  }

  @override
  void deactivate() {
    print('Lifecycle: deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('Lifecycle: dispose');
    super.dispose();
  }
}
