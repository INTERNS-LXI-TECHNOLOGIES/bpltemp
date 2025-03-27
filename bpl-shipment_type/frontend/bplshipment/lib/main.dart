import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_translations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _currentLocale = const Locale('en', 'US');
  final _formKey = GlobalKey<FormState>();

  void _changeLanguage(Locale locale) {
    setState(() {
      _currentLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _currentLocale,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('fr', 'FR'),
        Locale('de', 'DE'),
        Locale('hi', 'IN'),
      ],
      localizationsDelegates: const [
        AppTranslations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: _MainPage(changeLanguage: _changeLanguage, formKey: _formKey),
    );
  }
}

class _MainPage extends StatefulWidget {
  final Function(Locale) changeLanguage;
  final GlobalKey<FormState> formKey;

  const _MainPage({required this.changeLanguage, required this.formKey});

  @override
  __MainPageState createState() => __MainPageState();
}

class __MainPageState extends State<_MainPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _lookupNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _parentTypeController = TextEditingController();

  // Track which fields have been interacted with
  final Map<String, bool> _fieldTouched = {
    'id': false,
    'lookup_name': false,
    'name': false,
    'description': false,
    'parent_type': false,
  };

  @override
  void dispose() {
    _idController.dispose();
    _lookupNameController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _parentTypeController.dispose();
    super.dispose();
  }

  String? _validateId(String? value, BuildContext context) {
    if (!_fieldTouched['id']!) return null;
    final translations = AppTranslations.of(context);
    if (value == null || value.isEmpty) {
      return translations?.translate('field_required') ?? 'This field is required';
    }
    if (RegExp(r'[a-zA-Z]').hasMatch(value)) {
      return translations?.translate('no_alphabets') ?? 'ID cannot contain letters';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return translations?.translate('numbers_only') ?? 'Only numbers are allowed';
    }
    return null;
  }

  String? _validateName(String? value, BuildContext context) {
    final translations = AppTranslations.of(context);
    if (value == null || value.isEmpty) {
      return translations?.translate('field_required') ?? 'This field is required';
    }
    if (RegExp(r'^[0-9]').hasMatch(value)) {
      return translations?.translate('no_number_start') ?? 'Cannot start with a number';
    }
    if (!RegExp(r'^[a-zA-Z]').hasMatch(value)) {
      return translations?.translate('start_with_letter') ?? 'Must start with a letter';
    }
    return null;
  }

  String? _validateRequired(String? value, BuildContext context) {
    final translations = AppTranslations.of(context);
    if (value == null || value.isEmpty) {
      return translations?.translate('field_required') ?? 'This field is required';
    }
    return null;
  }

  void _markFieldTouched(String fieldName) {
    if (!_fieldTouched[fieldName]!) {
      setState(() {
        _fieldTouched[fieldName] = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final translations = AppTranslations.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFD2DAFC),
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
        title: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Colors.white, Colors.black],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(bounds),
          child: Text(
            translations?.translate('dashboard') ?? 'Dashboard',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language, color: Colors.white),
            onSelected: widget.changeLanguage,
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<Locale>(
                value: Locale('en', 'US'),
                child: Text('English'),
              ),
              const PopupMenuItem<Locale>(
                value: Locale('fr', 'FR'),
                child: Text('Français'),
              ),
              const PopupMenuItem<Locale>(
                value: Locale('de', 'DE'),
                child: Text('Deutsch'),
              ),
              const PopupMenuItem<Locale>(
                value: Locale('hi', 'IN'),
                child: Text('हिंदी'),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
            tooltip: translations?.translate('search') ?? 'Search',
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
            tooltip: translations?.translate('notifications') ?? 'Notifications',
          ),
        ],
      ),
      body: Form(
        key: widget.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction, // Enable auto-validation
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[800],
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            translations?.translate('shipment_type') ?? 'Shipment Type',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _idController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: translations?.translate('id') ?? 'ID',
                                  border: const OutlineInputBorder(),
                                ),
                                validator: (value) => _validateId(value, context),
                                onChanged: (value) => _markFieldTouched('id'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                controller: _lookupNameController,
                                decoration: InputDecoration(
                                  labelText: translations?.translate('lookup_name') ?? 'Lookup Name',
                                  border: const OutlineInputBorder(),
                                ),
                                validator: (value) => _validateName(value, context),
                                onChanged: (value) => _markFieldTouched('lookup_name'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  labelText: translations?.translate('name') ?? 'Name',
                                  border: const OutlineInputBorder(),
                                ),
                                validator: (value) => _validateName(value, context),
                                onChanged: (value) => _markFieldTouched('name'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                controller: _descriptionController,
                                decoration: InputDecoration(
                                  labelText: translations?.translate('description') ?? 'Description',
                                  border: const OutlineInputBorder(),
                                ),
                                validator: (value) => _validateRequired(value, context),
                                onChanged: (value) => _markFieldTouched('description'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _parentTypeController,
                          decoration: InputDecoration(
                            labelText: translations?.translate('parent_type') ?? 'Parent Type',
                            border: const OutlineInputBorder(),
                            suffixIcon: const Icon(Icons.search),
                          ),
                          validator: (value) => _validateName(value, context),
                          onChanged: (value) => _markFieldTouched('parent_type'),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[900],
                        ),
                        onPressed: () {
                          if (widget.formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  translations?.translate('form_valid') ?? 'Form is valid, saving...'),
                              ),
                            );
                          }
                        },
                        child: Text(
                          translations?.translate('save') ?? 'Save',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        onPressed: () {
                          widget.formKey.currentState!.reset();
                          _idController.clear();
                          _lookupNameController.clear();
                          _nameController.clear();
                          _descriptionController.clear();
                          _parentTypeController.clear();
                          setState(() {
                            _fieldTouched.updateAll((key, value) => false);
                          });
                        },
                        child: Text(
                          translations?.translate('cancel') ?? 'Cancel',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}