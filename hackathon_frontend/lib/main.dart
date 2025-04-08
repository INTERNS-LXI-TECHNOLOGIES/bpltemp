import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// No longer importing Blocs/Cubits for data
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart'; // Import Provider
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Import the LocaleProvider
import 'providers/locale_provider.dart';
import 'ui/home_page.dart';
// No longer importing data Cubits
// import 'cubit/company_cubit.dart';
// import 'cubit/employee_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provide only the LocaleProvider
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      // Use Consumer to listen for locale changes and rebuild MaterialApp
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateTitle:
                (context) => AppLocalizations.of(context)!.appTitle,

            // --- Localization Setup ---
            locale: localeProvider.locale, // <-- Use locale from provider
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            // --- End Localization Setup ---
            home:
                HomePage(), // HomePage still contains the language switcher UI
          );
        },
      ),
    );
  }
}
  