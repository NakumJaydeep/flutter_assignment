import 'package:flutter/material.dart';

class QuestionC5 extends StatefulWidget {
  const QuestionC5({super.key});

  @override
  State<QuestionC5> createState() => _QuestionC5State();
}

class _QuestionC5State extends State<QuestionC5> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Mobile: Drawer
          return Scaffold(
            appBar: AppBar(title: const Text('Responsive Nav (Mobile)')),
            drawer: Drawer(
              child: ListView(
                children: _buildNavItems(isDrawer: true),
              ),
            ),
            body: _buildBody(),
          );
        } else {
          // Desktop/Tablet: NavigationRail
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  labelType: NavigationRailLabelType.all,
                  destinations: const [
                    NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
                    NavigationRailDestination(icon: Icon(Icons.settings), label: Text('Settings')),
                    NavigationRailDestination(icon: Icon(Icons.person), label: Text('Profile')),
                  ],
                ),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(child: _buildBody()),
              ],
            ),
          );
        }
      },
    );
  }

  List<Widget> _buildNavItems({required bool isDrawer}) {
    return [
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('Home'),
        selected: _selectedIndex == 0,
        onTap: () {
          setState(() => _selectedIndex = 0);
          if (isDrawer) Navigator.pop(context);
        },
      ),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('Settings'),
        selected: _selectedIndex == 1,
        onTap: () {
          setState(() => _selectedIndex = 1);
          if (isDrawer) Navigator.pop(context);
        },
      ),
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text('Profile'),
        selected: _selectedIndex == 2,
        onTap: () {
          setState(() => _selectedIndex = 2);
          if (isDrawer) Navigator.pop(context);
        },
      ),
    ];
  }

  Widget _buildBody() {
    return Center(
      child: Text(
        'Selected Page: ${_selectedIndex == 0 ? "Home" : _selectedIndex == 1 ? "Settings" : "Profile"}',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
