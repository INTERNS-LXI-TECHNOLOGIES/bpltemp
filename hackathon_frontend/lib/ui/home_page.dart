import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart'; // Import Provider
import '../providers/locale_provider.dart'; // Import LocaleProvider
import 'crud/company_tab.dart';
import 'crud/employee_tab.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // Access the LocaleProvider - use 'read' if only calling methods, 'watch' if rebuilding based on its state here
    final localeProvider = context.read<LocaleProvider>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.appTitle),
          actions: [
            // Add actions to the AppBar
            PopupMenuButton<Locale>(
              icon: Icon(Icons.language), // Language icon
              tooltip: "Change Language", // Tooltip for the button
              // Called when a menu item is selected
              onSelected: (Locale selectedLocale) {
                // Call the provider method to update the locale
                localeProvider.setLocale(selectedLocale);
              },
              // Builds the menu items
              itemBuilder: (BuildContext context) {
                return AppLocalizations.supportedLocales.map((Locale locale) {
                  // Get the display name for the locale
                  final languageName = localeProvider.getLanguageName(locale);
                  return PopupMenuItem<Locale>(
                    value: locale, // The value returned when selected
                    child: Text(languageName),
                  );
                }).toList();
              },
            ),
          ],
          bottom: TabBar(
            tabs: [Tab(text: l10n.companiesTab), Tab(text: l10n.employeesTab)],
          ),
        ),
        body: TabBarView(children: [CompanyTab(), EmployeeTab()]),
      ),
    );
  }
}
