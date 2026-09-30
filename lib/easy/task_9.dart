import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class EasyTask9 extends StatelessWidget {
  const EasyTask9({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Easy 9: ChangeNotifier & Consumer')),
        body: Center(
          child: Consumer<CounterModel>(
            builder: (context, model, child) {
              return Text('Count: ${model.count}', style: const TextStyle(fontSize: 24));
            },
          ),
        ),
        floatingActionButton: Consumer<CounterModel>(
          builder: (context, model, child) {
            return FloatingActionButton(
              onPressed: model.increment,
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
