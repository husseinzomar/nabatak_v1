import 'package:flutter/material.dart';
import 'package:nabatak_v1/home_page.dart'; // Import your HomePage file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'نباتك', // Your app title
      theme: ThemeData(
        primarySwatch: Colors.green, // You can customize your theme here
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false, // Hide debug banner
      home: HomePage(), // Set HomePage as the initial screen
    );
  }
}
