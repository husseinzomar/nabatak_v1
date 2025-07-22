import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
