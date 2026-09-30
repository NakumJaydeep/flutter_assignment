import 'package:flutter/material.dart';

class LifecycleLogger extends StatefulWidget {
  final Widget child;
  const LifecycleLogger({super.key, required this.child});

  @override
  State<LifecycleLogger> createState() => _LifecycleLoggerState();
}

class _LifecycleLoggerState extends State<LifecycleLogger> {
  final List<String> _logs = [];

  void _addLog(String event) {
    final timestamp = DateTime.now().toString().split(' ').last;
    setState(() {
      _logs.insert(0, '[$timestamp] $event');
    });
    debugPrint('Lifecycle: $event');
  }

  @override
  void initState() {
    super.initState();
    _addLog('initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _addLog('didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant LifecycleLogger oldWidget) {
    super.didUpdateWidget(oldWidget);
    _addLog('didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
    _addLog('build');
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            color: Colors.grey[200],
            child: widget.child,
          ),
        ),
        const Divider(height: 1, thickness: 2),
        Expanded(
          flex: 2,
          child: ListView.builder(
            itemCount: _logs.length,
            itemBuilder: (context, index) => ListTile(
              dense: true,
              title: Text(_logs[index], style: const TextStyle(fontFamily: 'Courier', fontSize: 12)),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void deactivate() {
    _addLog('deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint('Lifecycle: dispose');
    super.dispose();
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Counter: $_count', style: const TextStyle(fontSize: 24)),
        ElevatedButton(
          onPressed: () => setState(() => _count++),
          child: const Text('Increment Child State'),
        ),
      ],
    );
  }
}

class QuestionC10 extends StatelessWidget {
  const QuestionC10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lifecycle Logger Utility')),
      body: const LifecycleLogger(
        child: CounterWidget(),
      ),
    );
  }
}
