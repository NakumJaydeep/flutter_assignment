import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

void main() => runApp(const MaterialApp(home: Q9Page()));

class Q9Page extends StatefulWidget {
  const Q9Page({super.key});
  @override
  State<Q9Page> createState() => _Q9PageState();
}

class _Q9PageState extends State<Q9Page> {
  File? _copiedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickAndCopyImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    
    if (image != null) {
      final Directory dir = await getApplicationDocumentsDirectory();
      final String fileName = p.basename(image.path);
      final File localImage = File(p.join(dir.path, fileName));
      
      await File(image.path).copy(localImage.path);
      
      setState(() {
        _copiedImage = localImage;
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Image copied to: ${localImage.path}")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Level 2 - Q9: Copy Image")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_copiedImage != null)
              Image.file(_copiedImage!, height: 200)
            else
              const Text("No image copied yet"),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _pickAndCopyImage, child: const Text("Pick Image from Gallery")),
          ],
        ),
      ),
    );
  }
}
