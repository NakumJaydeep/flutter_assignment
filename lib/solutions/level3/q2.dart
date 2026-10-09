import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

void main() => runApp(const MaterialApp(home: Q2Page()));

class Q2Page extends StatelessWidget {
  const Q2Page({super.key});

  final String imageUrl = "https://picsum.photos/500/500";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 3 - Q2: Image Cache")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Loading image using flutter_cache_manager:"),
            const SizedBox(height: 20),
            FutureBuilder(
              future: DefaultCacheManager().getSingleFile(imageUrl),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
                return Image.file(snapshot.data!, height: 300);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await DefaultCacheManager().removeFile(imageUrl);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Cache cleared for this image")));
              },
              child: const Text("Clear Cache"),
            ),
          ],
        ),
      ),
    );
  }
}
