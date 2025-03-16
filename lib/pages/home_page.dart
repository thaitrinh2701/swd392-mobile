import 'package:flutter/material.dart';
import 'package:swd392_mobile/pages/mangas_screen.dart';
import 'package:swd392_mobile/pages/setting_screen.dart';

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
    const NavigationDestination(
      icon: Icon(Icons.category),
      label: 'Categories',
    ),
    const NavigationDestination(
      icon: Icon(Icons.library_books),
      label: 'Library',
    ),
    const NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  final _screens = [
    const MangasScreen(),
    const Center(child: Text('Category Screen')),
    const Center(child: Text('Library Screen')),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
        child: NavigationBar(
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
      ),
    );
  }
}
