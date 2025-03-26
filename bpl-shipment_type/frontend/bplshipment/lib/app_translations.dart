import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class AppTranslations {
  late Map<String, dynamic> _localizedStrings;

  static AppTranslations? of(BuildContext context) {
    return Localizations.of<AppTranslations>(context, AppTranslations);
  }

  Future<void> load(Locale locale) async {
    String jsonString = await rootBundle.loadString('assets/translations/${locale.languageCode}.json');
    _localizedStrings = json.decode(jsonString);
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }

  static const LocalizationsDelegate<AppTranslations> delegate = _AppTranslationsDelegate();
}

class _AppTranslationsDelegate extends LocalizationsDelegate<AppTranslations> {
  const _AppTranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr', 'de', 'hi'].contains(locale.languageCode);

  @override
  Future<AppTranslations> load(Locale locale) async {
    AppTranslations translations = AppTranslations();
    await translations.load(locale);
    return translations;
  }

  @override
  bool shouldReload(_AppTranslationsDelegate old) => false;
}