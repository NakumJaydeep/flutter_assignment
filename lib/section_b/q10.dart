import 'package:flutter/material.dart';

class QuestionB10 extends StatelessWidget {
  const QuestionB10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aspect Ratio Media Card')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: Colors.grey[300],
                    child: const Center(child: Icon(Icons.play_circle_fill, size: 64, color: Colors.white)),
                  ),
                ),
                ListTile(
                  title: Text('Video Title $index'),
                  subtitle: const Text('Description of the video goes here.'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
