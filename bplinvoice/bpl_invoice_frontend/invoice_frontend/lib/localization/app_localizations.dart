import 'package:flutter/material.dart';

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
      'validation.required': 'This field is required',
      'validation.number': 'Please enter a valid number',
      'validation.minLength': 'Must be at least {min} characters',
      'validation.currency': 'Please select a currency',
      'validation.status': 'Please select a status',
      'formValidationError': 'Please fix all errors before submitting',
      'formSubmissionSuccess': 'Form submitted successfully!',
      'authTokenMissing': 'Authentication token is missing. Please log in again.',
      'submissionFailed': 'Submission failed',
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
      'validation.required': 'هذا الحقل مطلوب',
      'validation.number': 'الرجاء إدخال رقم صحيح',
      'validation.minLength': 'يجب أن يكون على الأقل {min} أحرف',
      'validation.currency': 'الرجاء اختيار العملة',
      'validation.status': 'الرجاء اختيار الحالة',
      'formValidationError': 'الرجاء تصحيح جميع الأخطاء قبل الإرسال',
      'formSubmissionSuccess': 'تم إرسال النموذج بنجاح!',
      'authTokenMissing': 'رمز المصادقة مفقود. يرجى تسجيل الدخول مرة أخرى.',
      'submissionFailed': 'فشل الإرسال',
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
      'validation.required': 'Dieses Feld ist erforderlich',
      'validation.number': 'Bitte geben Sie eine gültige Nummer ein',
      'validation.minLength': 'Muss mindestens {min} Zeichen lang sein',
      'validation.currency': 'Bitte wählen Sie eine Währung aus',
      'validation.status': 'Bitte wählen Sie einen Status aus',
      'formValidationError': 'Bitte beheben Sie alle Fehler vor dem Absenden',
      'formSubmissionSuccess': 'Formular erfolgreich übermittelt!',
      'authTokenMissing': 'Authentifizierungstoken fehlt. Bitte melden Sie sich erneut an.',
      'submissionFailed': 'Übermittlung fehlgeschlagen',
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
      'validation.required': 'ഈ ഫീൽഡ് ആവശ്യമാണ്',
      'validation.number': 'ദയവായി ഒരു സാധുതയുള്ള നമ്പർ നൽകുക',
      'validation.minLength': 'കുറഞ്ഞത് {min} അക്ഷരങ്ങൾ ആയിരിക്കണം',
      'validation.currency': 'ദയവായി ഒരു കറൻസി തിരഞ്ഞെടുക്കുക',
      'validation.status': 'ദയവായി ഒരു സ്റ്റാറ്റസ് തിരഞ്ഞെടുക്കുക',
      'formValidationError': 'സമർപ്പിക്കുന്നതിന് മുമ്പ് എല്ലാ പിശകുകളും പരിഹരിക്കുക',
      'formSubmissionSuccess': 'ഫോം വിജയകരമായി സമർപ്പിച്ചു!',
      'authTokenMissing': 'ഓതെന്റിക്കേഷൻ ടോക്കൺ കാണുന്നില്ല. ദയവായി വീണ്ടും ലോഗിൻ ചെയ്യുക.',
      'submissionFailed': 'സമർപ്പണം പരാജയപ്പെട്ടു',
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
  String get formValidationError => _localizedValues[locale.languageCode]!['formValidationError']!;
  String get formSubmissionSuccess => _localizedValues[locale.languageCode]!['formSubmissionSuccess']!;
  String get authTokenMissing => _localizedValues[locale.languageCode]!['authTokenMissing']!;
  String get submissionFailed => _localizedValues[locale.languageCode]!['submissionFailed']!;

  String getValidationMessage(String errorType, String fieldName) {
    final fieldLabel = _getFieldLabel(fieldName);
    final message = _localizedValues[locale.languageCode]!['validation.$errorType']!;
    
    switch (errorType) {
      case 'minLength':
        return message.replaceAll('{min}', '3');
      default:
        return message.replaceAll('{field}', fieldLabel);
    }
  }

  String _getFieldLabel(String fieldName) {
    switch (fieldName) {
      case 'id': return id;
      case 'boxLimit': return boxLimit;
      case 'shipmentType': return shipmentType;
      case 'opfac': return opfac;
      case 'deliveryAgent': return deliveryAgent;
      case 'estimatedReadyDate': return estimatedReadyDate;
      case 'estimatedShipDate': return estimatedShipDate;
      case 'referenceNumber': return referenceNumber;
      case 'currency': return currencyUom;
      case 'status': return status;
      default: return fieldName;
    }
  }
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