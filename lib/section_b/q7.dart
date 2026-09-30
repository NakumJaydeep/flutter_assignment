import 'package:flutter/material.dart';

class QuestionB7 extends StatelessWidget {
  const QuestionB7({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Demo'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.photo), text: 'Photos'),
              Tab(icon: Icon(Icons.video_library), text: 'Videos'),
              Tab(icon: Icon(Icons.file_copy), text: 'Files'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Photos Content')),
            Center(child: Text('Videos Content')),
            Center(child: Text('Files Content')),
          ],
        ),
      ),
    );
  }
}
