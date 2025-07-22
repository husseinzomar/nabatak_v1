import 'package:flutter/material.dart';
import 'package:nabatak_v1/Pages/bottomNavigationBar.dart';
import 'package:nabatak_v1/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:nabatak_v1/Pages/splash_screen.dart'; // Import SplashScreen
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences

void main() async {
  // Make main async to use await
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
  runApp(const MyApp());
}

class LocaleProvider with ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        final provider = Provider.of<LocaleProvider>(context);

        return MaterialApp(
          locale: provider.locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          title: 'نباتك', // Your app title
          theme: ThemeData(
            primarySwatch: Colors.green, // You can customize your theme here
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          debugShowCheckedModeBanner: false, // Hide debug banner

          home: SplashScreen(), // Set SplashScreen as the initial screen
        );
      },
    );
  }
}

// Add a list of supported locales for the LocaleProvider
class L10n {
  static final all = [const Locale('en'), const Locale('ar')];
}
