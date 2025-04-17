import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon/bloc/company_cubit.dart';
import 'l10n/l10n.dart';
import 'ui/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompanyCubit(), // Provide the CompanyCubit
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Advanced Flutter CRUD',
        locale: Locale('en'),
        supportedLocales: L10n.all,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: HomePage(),
      ),
    );
  }
}
