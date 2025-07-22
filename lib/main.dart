import 'package:flutter/material.dart';
import 'package:nabatak_v1/Pages/homepage.dart';
import 'package:nabatak_v1/l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar'), // أضف اللغات التي تدعمها
        Locale('en'),
      ],
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
