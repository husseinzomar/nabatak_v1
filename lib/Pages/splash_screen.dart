import 'package:flutter/material.dart';
import 'dart:async';
import 'package:nabatak_v1/Pages/onboarding_screen.dart';
import 'package:nabatak_v1/Pages/bottomNavigationBar.dart'; // Assuming MainScreen is in this file
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), _checkFirstLaunch); // Adjust the duration as needed
  }

  void _checkFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

    if (isFirstLaunch) {
      // Navigate to OnboardingScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
      // Set the flag to false after showing onboarding
      prefs.setBool('isFirstLaunch', false);
    } else {
      // Navigate to MainScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Implement splash screen with app logo and possibly loading indicator
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace with your app logo
            Icon(
              Icons.grass,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 24),
            Text(
              'Nabatk', // TODO: Localize app name
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            // TODO: Add a loading indicator if needed
          ],
        ),
      ),
    );
  }
}
