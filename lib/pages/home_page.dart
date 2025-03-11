import 'package:flutter/material.dart';
import 'package:swd392_mobile/pages/mangas_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.index});

  final int? index;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    if (widget.index != null) {
      _selectedIndex = widget.index!;
    }
    super.initState();
  }

  final _destinations = [
    const NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
    const NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
    const NavigationDestination(
      icon: Icon(Icons.category),
      label: 'Categories',
    ),
    const NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  final _screens = [
    const MangasScreen(),
    const Center(child: Text('Search Screen')),
    const Center(child: Text('Categories Screen')),
    const Center(child: Text('Settings Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        elevation: 12,
        backgroundColor: Theme.of(context).dialogTheme.backgroundColor,
        selectedIndex: _selectedIndex,
        destinations: _destinations,
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
