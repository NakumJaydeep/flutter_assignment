import 'package:flutter/material.dart';

class QuestionC6 extends StatelessWidget {
  const QuestionC6({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Multi-Tab Profile'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.grid_on), text: 'Photos'),
              Tab(icon: Icon(Icons.list), text: 'Activity'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Photos Tab - GridView
            GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: 21,
              itemBuilder: (context, index) => Image.network(
                'https://picsum.photos/200?random=$index',
                fit: BoxFit.cover,
              ),
            ),
            // Activity Tab - ListView
            ListView.separated(
              itemCount: 15,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) => ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text('Activity Item $index'),
                subtitle: Text('User performed some action at ${DateTime.now().hour}:${DateTime.now().minute}'),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
