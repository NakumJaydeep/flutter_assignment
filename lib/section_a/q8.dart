import 'package:flutter/material.dart';

class Question8 extends StatefulWidget {
  const Question8({super.key});

  @override
  State<Question8> createState() => _Question8State();
}

class _Question8State extends State<Question8> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('Home Screen', style: TextStyle(fontSize: 30))),
    Center(child: Text('Search Screen', style: TextStyle(fontSize: 30))),
    Center(child: Text('Profile Screen', style: TextStyle(fontSize: 30))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Question 8')),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
