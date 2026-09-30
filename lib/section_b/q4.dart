import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;
  final VoidCallback onTap;

  const ProfileCard({
    super.key,
    required this.name,
    required this.role,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
        title: Text(name),
        subtitle: Text(role),
        onTap: onTap,
      ),
    );
  }
}

class QuestionB4 extends StatelessWidget {
  const QuestionB4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom ProfileCard')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ProfileCard(
            name: 'Alice Smith',
            role: 'Developer',
            imageUrl: 'https://i.pravatar.cc/150?u=alice',
            onTap: () {},
          ),
          ProfileCard(
            name: 'Bob Johnson',
            role: 'Designer',
            imageUrl: 'https://i.pravatar.cc/150?u=bob',
            onTap: () {},
          ),
          ProfileCard(
            name: 'Charlie Brown',
            role: 'Manager',
            imageUrl: 'https://i.pravatar.cc/150?u=charlie',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
