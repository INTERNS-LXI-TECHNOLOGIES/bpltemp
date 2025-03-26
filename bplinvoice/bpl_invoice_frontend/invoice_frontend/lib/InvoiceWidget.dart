import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:openapi/openapi.dart';
import 'localization/app_localizations.dart';

class InvoiceWidget extends StatefulWidget {
  const InvoiceWidget({super.key});

  @override
  State<InvoiceWidget> createState() => _InvoiceWidgetState();
}

class _InvoiceWidgetState extends State<InvoiceWidget> {
  final List<TextEditingController> _controllers = List.generate(
    8,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    8,
    (index) => FocusNode(),
  );
  final _formKey = GlobalKey<FormState>();

  final List<String> currencies = [
    'SAUDI_RIYAL',
    'USD',
    'EUR',
    'GBP',
    'INR',
    'AED',
    'JPY',
    'CNY'
  ];
  String? selectedCurrency = 'SAUDI_RIYAL';

  final List<String> statusOptions = ['Status Positive', 'Status Negative'];
  String? selectedStatus = 'Status Positive';

  Locale _currentLocale = const Locale('en');
  Map<String, String> validationErrors = {};

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _changeLanguage(Locale locale) {
    setState(() {
      _currentLocale = locale;
    });
  }

  bool _validateForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    setState(() {
      if (!isValid) {
        validationErrors.clear();
      }
    });
    return isValid;
  }

  String? _validateField(String value, String fieldName) {
    if (value.isEmpty) {
      final errorMessage = AppLocalizations.of(context).getValidationMessage('required', fieldName);
      setState(() {
        validationErrors[fieldName] = errorMessage;
      });
      return errorMessage;
    }

    switch (fieldName) {
      case 'boxLimit':
        if (int.tryParse(value) == null) {
          final errorMessage = AppLocalizations.of(context).getValidationMessage('number', fieldName);
          setState(() {
            validationErrors[fieldName] = errorMessage;
          });
          return errorMessage;
        }
        break;
      case 'referenceNumber':
        if (value.length < 3) {
          final errorMessage = AppLocalizations.of(context).getValidationMessage('minLength', fieldName);
          setState(() {
            validationErrors[fieldName] = errorMessage;
          });
          return errorMessage;
        }
        break;
    }

    setState(() {
      validationErrors.remove(fieldName);
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return MaterialApp(
      locale: _currentLocale,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
        Locale('de'),
        Locale('ml'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Builder(
        builder: (context) {
          return Directionality(
            textDirection: _currentLocale.languageCode == 'ar' 
                ? TextDirection.rtl 
                : TextDirection.ltr,
            child: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: colorScheme.primary,
                  title: Text(
                    AppLocalizations.of(context).wayBill,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  elevation: 2,
                  actions: [
                    DropdownButton<Locale>(
                      underline: const SizedBox(),
                      icon: const Icon(Icons.language, color: Colors.white),
                      value: _currentLocale,
                      items: const [
                        DropdownMenuItem(
                          value: Locale('en'),
                          child: Text('EN'),
                        ),
                        DropdownMenuItem(
                          value: Locale('ar'),
                          child: Text('AR'),
                        ),
                        DropdownMenuItem(
                          value: Locale('de'),
                          child: Text('DE'),
                        ),
                        DropdownMenuItem(
                          value: Locale('ml'),
                          child: Text('ML'),
                        ),
                      ],
                      onChanged: (Locale? value) {
                        if (value != null) {
                          _changeLanguage(value);
                        }
                      },
                    ),
                  ],
                ),
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            _buildTopActionBar(context, theme),
                            const SizedBox(height: 16),
                            _buildFormSection(context, theme, colorScheme),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTopActionBar(BuildContext context, ThemeData theme) {
    final actionItems = [
      _ActionItem(Icons.local_shipping, AppLocalizations.of(context).invDetails),
      _ActionItem(Icons.inventory_2, AppLocalizations.of(context).shipItems),
      _ActionItem(Icons.inventory, AppLocalizations.of(context).shipBoxes),
      _ActionItem(Icons.view_in_ar, AppLocalizations.of(context).cargo),
      _ActionItem(Icons.print, AppLocalizations.of(context).printInvoice),
      _ActionItem(Icons.receipt_long, AppLocalizations.of(context).customsInvoice),
    ];

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var item in actionItems) ...[
                          _buildActionButton(item),
                          const SizedBox(width: 8),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_drop_down, size: 20),
                  label: Text(AppLocalizations.of(context).switchInvoice),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(_ActionItem item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(item.icon, color: Colors.blue[700], size: 20),
            const SizedBox(width: 8),
            Text(
              item.label,
              style: TextStyle(
                color: Colors.blue[700],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormSection(
      BuildContext context, ThemeData theme, ColorScheme colorScheme) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _buildFormField(
                        AppLocalizations.of(context).id, 
                        controller: _controllers[0],
                        fieldName: 'id',
                      ),
                      const SizedBox(height: 16),
                      _buildFormField(
                        AppLocalizations.of(context).boxLimit,
                        controller: _controllers[1],
                        keyboardType: TextInputType.number,
                        fieldName: 'boxLimit',
                      ),
                      const SizedBox(height: 16),
                      _buildFormField(
                        AppLocalizations.of(context).shipmentType,
                        controller: _controllers[2],
                        suffixIcon: Icons.search,
                        fieldName: 'shipmentType',
                      ),
                      const SizedBox(height: 16),
                      _buildFormField(
                        AppLocalizations.of(context).opfac,
                        controller: _controllers[3],
                        suffixIcon: Icons.search,
                        fieldName: 'opfac',
                      ),
                      const SizedBox(height: 16),
                      _buildFormField(
                        AppLocalizations.of(context).deliveryAgent,
                        controller: _controllers[4],
                        suffixIcon: Icons.search,
                        fieldName: 'deliveryAgent',
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      _buildFormField(
                        AppLocalizations.of(context).estimatedReadyDate,
                        controller: _controllers[5],
                        suffixIcon: Icons.calendar_today,
                        fieldName: 'estimatedReadyDate',
                      ),
                      const SizedBox(height: 16),
                      _buildCurrencyDropdown(context),
                      const SizedBox(height: 16),
                      _buildFormField(
                        AppLocalizations.of(context).estimatedShipDate,
                        controller: _controllers[6],
                        suffixIcon: Icons.calendar_today,
                        fieldName: 'estimatedShipDate',
                      ),
                      const SizedBox(height: 16),
                      _buildStatusDropdown(context),
                      const SizedBox(height: 16),
                      _buildFormField(
                        AppLocalizations.of(context).referenceNumber,
                        controller: _controllers[7],
                        fieldName: 'referenceNumber',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {
                    _formKey.currentState?.reset();
                    setState(() {
                      validationErrors.clear();
                      selectedCurrency = 'SAUDI_RIYAL';
                      selectedStatus = 'Status Positive';
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.grey[700],
                    backgroundColor: Colors.grey[200],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(AppLocalizations.of(context).cancel),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () async {
                    final jwtToken = Openapi.jwt;
                    if (jwtToken == null || jwtToken.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppLocalizations.of(context).authTokenMissing),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    if (!_validateForm()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppLocalizations.of(context).formValidationError),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    try {
                      final currencyIdMap = {
                        'SAUDI_RIYAL': 1,
                        'USD': 2,
                        'EUR': 3,
                        'GBP': 4,
                        'INR': 5,
                        'AED': 6,
                        'JPY': 7,
                        'CNY': 8,
                      };

                      final currencyId = currencyIdMap[selectedCurrency];
                      if (currencyId == null) {
                        throw Exception('Invalid currency selected');
                      }

                      final currencyType = CurrencyTypeBuilder()
                        ..name = selectedCurrency
                        ..id = currencyId;

                      final wayBillBuilder = WayBillBuilder()
                        ..boxLimit = int.tryParse(_controllers[1].text)
                         ..shipmentType = _controllers[2].text
                        ..opfac = _controllers[3].text
                          ..deliveryAgent = _controllers[4].text
                        ..estimatedReadyDate = DateTime.parse(_controllers[5].text)
                          ..currencyUom = selectedCurrency
                        ..estimatedShipDate = DateTime.parse(_controllers[6].text)
                         ..status = selectedStatus
                         ..referenceNumber = _controllers[7].text
                         ..currencyType = currencyType;

                      final response = await Openapi().getWayBillResourceApi().createWayBill(wayBill: wayBillBuilder.build(),
                            headers: {'Authorization': 'Bearer $jwtToken'}
                          );

                      _formKey.currentState?.reset();
                      setState(() {
                        validationErrors.clear();
                        selectedCurrency = 'SAUDI_RIYAL';
                        selectedStatus = 'Status Positive';
                        for (var controller in _controllers) {
                          controller.clear();
                        }
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppLocalizations.of(context).formSubmissionSuccess),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } on FormatException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${AppLocalizations.of(context).submissionFailed}: Invalid date format'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${AppLocalizations.of(context).submissionFailed}: ${e.toString()}'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(AppLocalizations.of(context).save),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(
    String label, {
    required TextEditingController controller,
    required String fieldName,
    TextInputType? keyboardType,
    String? hintText,
    IconData? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: (value) => _validateField(value ?? '', fieldName),
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            errorText: validationErrors[fieldName],
            errorStyle: const TextStyle(color: Colors.red),
            suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          ),
        ),
      ],
    );
  }

  Widget _buildCurrencyDropdown(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context).currencyUom,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedCurrency,
          validator: (value) {
            if (value == null) {
              return AppLocalizations.of(context).getValidationMessage('required', 'currency');
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            errorStyle: const TextStyle(color: Colors.red),
          ),
          items: currencies.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedCurrency = newValue;
            });
          },
        ),
      ],
    );
  }

  Widget _buildStatusDropdown(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context).status,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedStatus,
          validator: (value) {
            if (value == null) {
              return AppLocalizations.of(context).getValidationMessage('required', 'status');
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            errorStyle: const TextStyle(color: Colors.red),
          ),
          items: statusOptions.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedStatus = newValue;
            });
          },
        ),
      ],
    );
  }
}

class _ActionItem {
  final IconData icon;
  final String label;

  _ActionItem(this.icon, this.label);
}