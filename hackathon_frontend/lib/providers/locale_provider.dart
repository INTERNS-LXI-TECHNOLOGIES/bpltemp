import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // To access supportedLocales
import 'package:flutter/widgets.dart'; // Ensure context is available for AppLocalizations

class LocaleProvider extends ChangeNotifier {
  // Default to the first supported locale (usually 'en')
  Locale _locale = AppLocalizations.supportedLocales.first;

  Locale get locale => _locale;

  void setLocale(Locale newLocale) {
    if (!AppLocalizations.supportedLocales.contains(newLocale)) {
      throw ArgumentError('Unsupported locale: ${newLocale.languageCode}');
    }
    if (!AppLocalizations.supportedLocales.contains(newLocale)) return;

    // Only update and notify if the locale actually changes
    if (_locale != newLocale) {
      _locale = newLocale;
      print("Locale changed to: ${_locale.languageCode}");
      notifyListeners();
      // TODO (Optional): Persist locale preference using shared_preferences here
    }
  }

  // Helper to get a display name for a locale
  String getLanguageName(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'es':
        return 'Español';
      case 'ta': // Add Tamil
        return 'தமிழ்'; // Tamil
      case 'ml': // Add Malayalam
        return 'മലയാളം'; // Malayalam
      default:
        return locale.languageCode; // Fallback to language code
    }
  }
}
