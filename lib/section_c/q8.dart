import 'package:flutter/material.dart';

class QuestionC8 extends StatelessWidget {
  const QuestionC8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Header')),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://picsum.photos/800/400?beach'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: -50,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=profile'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          const Text('John Doe', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const Text('Mobile App Developer', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
