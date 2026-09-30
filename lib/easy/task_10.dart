import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataModel extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  void increment() {
    _value++;
    notifyListeners();
  }
}

class EasyTask10 extends StatelessWidget {
  const EasyTask10({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataModel(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Easy 10: read() vs watch()')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const WatchWidget(),
              const SizedBox(height: 20),
              const ReadButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class WatchWidget extends StatelessWidget {
  const WatchWidget({super.key});
  @override
  Widget build(BuildContext context) {
    // watch() listens for changes and rebuilds the widget
    final value = context.watch<DataModel>().value;
    return Text('Watched Value: $value', style: const TextStyle(fontSize: 24));
  }
}

class ReadButton extends StatelessWidget {
  const ReadButton({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // read() just gets the current value or calls a method without listening for changes
        context.read<DataModel>().increment();
      },
      child: const Text('Increment (using read)'),
    );
  }
}
