import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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

  // Currency dropdown variables
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

  // Status dropdown variables
  final List<String> statusOptions = [
    'Status Positive',
    'Status Negative'
  ];
  String? selectedStatus = 'Status Positive';

  Locale _currentLocale = const Locale('en');

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
                      _buildFormField(AppLocalizations.of(context).id, 
                          controller: _controllers[0]),
                      const SizedBox(height: 16),
                      _buildFormField(AppLocalizations.of(context).boxLimit,
                          controller: _controllers[1],
                          keyboardType: TextInputType.number),
                      const SizedBox(height: 16),
                      _buildFormField(AppLocalizations.of(context).shipmentType,
                          controller: _controllers[2], suffixIcon: Icons.search),
                      const SizedBox(height: 16),
                      _buildFormField(AppLocalizations.of(context).opfac,
                          controller: _controllers[3], suffixIcon: Icons.search),
                      const SizedBox(height: 16),
                      _buildFormField(AppLocalizations.of(context).deliveryAgent,
                          controller: _controllers[4], suffixIcon: Icons.search),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      _buildFormField(AppLocalizations.of(context).estimatedReadyDate,
                          controller: _controllers[5],
                          suffixIcon: Icons.calendar_today),
                      const SizedBox(height: 16),
                      _buildCurrencyDropdown(context),
                      const SizedBox(height: 16),
                      _buildFormField(AppLocalizations.of(context).estimatedShipDate,
                          controller: _controllers[6],
                          suffixIcon: Icons.calendar_today),
                      const SizedBox(height: 16),
                      _buildStatusDropdown(context),
                      const SizedBox(height: 16),
                      _buildFormField(AppLocalizations.of(context).referenceNumber,
                          controller: _controllers[7]),
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
                  onPressed: () {print('cancel button');},
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
                  onPressed: () {print('submit button');},
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

  Widget _buildFormField(String label,
      {required TextEditingController controller,
      TextInputType? keyboardType,
      String? hintText,
      IconData? suffixIcon}) {
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

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'wayBill': 'Way Bill',
      'invDetails': 'Inv. Details',
      'shipItems': 'Ship Items',
      'shipBoxes': 'Ship Boxes',
      'cargo': 'Cargo',
      'printInvoice': 'Print Invoice',
      'customsInvoice': 'Customs Invoice',
      'switchInvoice': 'Switch to another invoice',
      'id': 'Id',
      'boxLimit': 'Box Limit',
      'shipmentType': 'Shipment Type',
      'opfac': 'OPFAC',
      'deliveryAgent': 'Delivery Agent',
      'estimatedReadyDate': 'Estimated Ready Date',
      'estimatedShipDate': 'Estimated Ship Date',
      'referenceNumber': 'Reference Number',
      'currencyUom': 'Currency UoM',
      'status': 'Status',
      'cancel': 'Cancel',
      'save': 'Save',
    },
    'ar': {
      'wayBill': 'فاتورة الطريق',
      'invDetails': 'تفاصيل الفاتورة',
      'shipItems': 'شحن العناصر',
      'shipBoxes': 'صناديق الشحن',
      'cargo': 'البضائع',
      'printInvoice': 'طباعة الفاتورة',
      'customsInvoice': 'فاتورة الجمارك',
      'switchInvoice': 'التبديل إلى فاتورة أخرى',
      'id': 'هوية',
      'boxLimit': 'حد الصندوق',
      'shipmentType': 'نوع الشحنة',
      'opfac': 'OPFAC',
      'deliveryAgent': 'وكيل التوصيل',
      'estimatedReadyDate': 'تاريخ الجاهزية المتوقع',
      'estimatedShipDate': 'تاريخ الشحن المتوقع',
      'referenceNumber': 'الرقم المرجعي',
      'currencyUom': 'وحدة العملة',
      'status': 'حالة',
      'cancel': 'إلغاء',
      'save': 'حفظ',
    },
    'de': {
    'wayBill': 'Frachtbrief',
    'invDetails': 'Rechnungsdetails',
    'shipItems': 'Artikel versenden',
    'shipBoxes': 'Kisten versenden',
    'cargo': 'Fracht',
    'printInvoice': 'Rechnung drucken',
    'customsInvoice': 'Zollrechnung',
    'switchInvoice': 'Zu einer anderen Rechnung wechseln',
    'id': 'ID',
    'boxLimit': 'Kistenlimit',
    'shipmentType': 'Versandart',
    'opfac': 'OPFAC',
    'deliveryAgent': 'Zustellagent',
    'estimatedReadyDate': 'Voraussichtliches Fertigstellungsdatum',
    'estimatedShipDate': 'Voraussichtliches Versanddatum',
    'referenceNumber': 'Referenznummer',
    'currencyUom': 'Währungseinheit',
    'status': 'Status',
    'cancel': 'Abbrechen',
    'save': 'Speichern',
  },
    'ml': {
    'wayBill': 'വേ ബിൽ',
    'invDetails': 'ഇൻവോയ്സ് വിവരങ്ങൾ',
    'shipItems': 'സാധനങ്ങൾ അയയ്ക്കുക',
    'shipBoxes': 'പെട്ടികൾ അയയ്ക്കുക',
    'cargo': 'കാർഗോ',
    'printInvoice': 'ഇൻവോയ്സ് പ്രിന്റ് ചെയ്യുക',
    'customsInvoice': 'കസ്റ്റംസ് ഇൻവോയ്സ്',
    'switchInvoice': 'മറ്റൊരു ഇൻവോയ്സിലേക്ക് മാറുക',
    'id': 'ഐഡി',
    'boxLimit': 'പെട്ടി ലിമിറ്റ്',
    'shipmentType': 'ഷിപ്പ്മെന്റ് തരം',
    'opfac': 'OPFAC',
    'deliveryAgent': 'ഡെലിവറി ഏജന്റ്',
    'estimatedReadyDate': 'എസ്റ്റിമേറ്റഡ് റെഡി തീയതി',
    'estimatedShipDate': 'എസ്റ്റിമേറ്റഡ് ഷിപ്പ് തീയതി',
    'referenceNumber': 'റഫറൻസ് നമ്പർ',
    'currencyUom': 'കറൻസി യൂണിറ്റ്',
    'status': 'സ്റ്റാറ്റസ്',
    'cancel': 'റദ്ദാക്കുക',
    'save': 'സേവ്',
  },
  };

  String get wayBill => _localizedValues[locale.languageCode]!['wayBill']!;
  String get invDetails => _localizedValues[locale.languageCode]!['invDetails']!;
  String get shipItems => _localizedValues[locale.languageCode]!['shipItems']!;
  String get shipBoxes => _localizedValues[locale.languageCode]!['shipBoxes']!;
  String get cargo => _localizedValues[locale.languageCode]!['cargo']!;
  String get printInvoice => _localizedValues[locale.languageCode]!['printInvoice']!;
  String get customsInvoice => _localizedValues[locale.languageCode]!['customsInvoice']!;
  String get switchInvoice => _localizedValues[locale.languageCode]!['switchInvoice']!;
  String get id => _localizedValues[locale.languageCode]!['id']!;
  String get boxLimit => _localizedValues[locale.languageCode]!['boxLimit']!;
  String get shipmentType => _localizedValues[locale.languageCode]!['shipmentType']!;
  String get opfac => _localizedValues[locale.languageCode]!['opfac']!;
  String get deliveryAgent => _localizedValues[locale.languageCode]!['deliveryAgent']!;
  String get estimatedReadyDate => _localizedValues[locale.languageCode]!['estimatedReadyDate']!;
  String get estimatedShipDate => _localizedValues[locale.languageCode]!['estimatedShipDate']!;
  String get referenceNumber => _localizedValues[locale.languageCode]!['referenceNumber']!;
  String get currencyUom => _localizedValues[locale.languageCode]!['currencyUom']!;
  String get status => _localizedValues[locale.languageCode]!['status']!;
  String get cancel => _localizedValues[locale.languageCode]!['cancel']!;
  String get save => _localizedValues[locale.languageCode]!['save']!;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

@override
bool isSupported(Locale locale) => ['en', 'ar', 'de', 'ml'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}