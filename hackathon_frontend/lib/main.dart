import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:openapi/openapi.dart';

import 'cubit/company_cubit.dart';
import 'cubit/employee_cubit.dart';
import 'providers/locale_provider.dart';
import 'ui/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Openapi apiClient = Openapi();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, _) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => CompanyCubit(apiClient)),
              BlocProvider(create: (_) => EmployeeCubit(apiClient)),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'BPL App',
              locale: localeProvider.locale, // dynamic locale switching
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              home: HomePage(),
            ),
          );
        },
      ),
    );
  }
}
