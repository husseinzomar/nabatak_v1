import 'package:flutter/material.dart';
import 'package:nabatak_v1/Pages/homepage.dart';
import 'package:nabatak_v1/Pages/settings_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    SettingsPage(),
    // Add other pages here
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ), // TODO: Replace with appropriate icons and localize labels
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ), // TODO: Replace with appropriate icons and localize labels
            label: 'Settings',
          ),
          // Add other BottomNavigationBarItem widgets here
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(
          255,
          76,
          108,
          77,
        ), // Customize selected item color
        backgroundColor: const Color.fromARGB(255, 243, 246, 244),
        onTap: _onItemTapped,
      ),
    );
  }
}
