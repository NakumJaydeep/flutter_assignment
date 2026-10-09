import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const Q6App());

class Q6App extends StatefulWidget {
  const Q6App({super.key});
  @override
  State<Q6App> createState() => _Q6AppState();
}

class _Q6AppState extends State<Q6App> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('is_dark_mode') ?? false;
    });
  }

  Future<void> _toggleTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_dark_mode', value);
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(title: const Text("Level 2 - Q6: Theme Settings")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Current Mode: ${_isDarkMode ? 'Dark' : 'Light'}", style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              SwitchListTile(
                title: const Text("Dark Mode"),
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
