import 'package:flutter/material.dart';
import 'package:nabatak_v1/Pages/homepage.dart';
import 'package:nabatak_v1/Pages/settings_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:provider/provider.dart';

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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppLocalizations.of(context).home, // Localized label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: AppLocalizations.of(context).settingsTitle, // Localized label
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
