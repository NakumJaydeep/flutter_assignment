import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart'; // To access ThemeProvider if defined there, or define it here.

// For simplicity in this practical, we'll define a local switcher that affects the global state.
class HardTask7 extends StatelessWidget {
  const HardTask7({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<GlobalThemeProvider>(context);
    
    return Scaffold(
      appBar: AppBar(title: const Text('Hard 7: Theme Switcher')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Theme: ${themeProvider.isDarkMode ? "Dark" : "Light"}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            ),
            const Text('Toggle to change theme across the entire app'),
          ],
        ),
      ),
    );
  }
}
