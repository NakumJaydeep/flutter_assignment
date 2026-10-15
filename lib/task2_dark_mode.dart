import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Task2DarkMode extends StatefulWidget {
  const Task2DarkMode({super.key});

  @override
  State<Task2DarkMode> createState() => _Task2DarkModeState();
}

class _Task2DarkModeState extends State<Task2DarkMode> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  _toggleTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = value;
    });
    await prefs.setBool('isDarkMode', value);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Task 2: Dark Mode Switch")),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Dark Mode"),
              Switch(
                value: _isDarkMode,
                onChanged: _toggleTheme,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
