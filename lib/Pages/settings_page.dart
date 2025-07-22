import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nabatak_v1/main.dart'; // Import your main.dart file to access LocaleProvider and L10n

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settingsTitle), // Localized settings title
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context).language, // Localized language setting title
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButton<Locale>(
              value: Localizations.localeOf(context), // Get current locale
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (Locale? newValue) {
                if (newValue != null) {
                  final provider = Provider.of<LocaleProvider>(context, listen: false);
                  provider.setLocale(newValue);
                }
              },
              items: L10n.all.map<DropdownMenuItem<Locale>>((Locale locale) {
                return DropdownMenuItem<Locale>(
                  value: locale,
                  child: Text(locale.languageCode == 'en' ? 'English' : 'العربية'), // Display language names
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
