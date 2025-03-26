import 'package:flutter/material.dart';

class InvoiceWidget extends StatefulWidget {
  const InvoiceWidget({super.key});

  @override
  State<InvoiceWidget> createState() => _InvoiceWidgetState();
}

class _InvoiceWidgetState extends State<InvoiceWidget> {
  final List<TextEditingController> _controllers = List.generate(
    8, // Reduced since we're replacing two with dropdowns
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    8, // Reduced since we're replacing two with dropdowns
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.primary,
          title: const Text(
            'Way Bill',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 2,
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
    );
  }

  Widget _buildTopActionBar(BuildContext context, ThemeData theme) {
    final actionItems = [
      _ActionItem(Icons.local_shipping, 'Inv. Details'),
      _ActionItem(Icons.inventory_2, 'Ship Items'),
      _ActionItem(Icons.inventory, 'Ship Boxes'),
      _ActionItem(Icons.view_in_ar, 'Cargo'),
      _ActionItem(Icons.print, 'Print Invoice'),
      _ActionItem(Icons.receipt_long, 'Customs Invoice'),
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
                  label: const Text('Switch to another invoice'),
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
                      _buildFormField('Id', controller: _controllers[0]),
                      const SizedBox(height: 16),
                      _buildFormField('Box Limit',
                          controller: _controllers[1],
                          keyboardType: TextInputType.number),
                      const SizedBox(height: 16),
                      _buildFormField('Shipment Type',
                          controller: _controllers[2], suffixIcon: Icons.search),
                      const SizedBox(height: 16),
                      _buildFormField('OPFAC',
                          controller: _controllers[3], suffixIcon: Icons.search),
                      const SizedBox(height: 16),
                      _buildFormField('Delivery Agent',
                          controller: _controllers[4], suffixIcon: Icons.search),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      _buildFormField('Estimated Ready Date',
                          controller: _controllers[5],
                          suffixIcon: Icons.calendar_today),
                      const SizedBox(height: 16),
                      _buildCurrencyDropdown(),
                      const SizedBox(height: 16),
                      _buildFormField('Estimated Ship Date',
                          controller: _controllers[6],
                          suffixIcon: Icons.calendar_today),
                      const SizedBox(height: 16),
                      _buildStatusDropdown(),
                      const SizedBox(height: 16),
                      _buildFormField('Reference Number',
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
                  child: const Text('Cancel'),
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
                  child: const Text('Save'),
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

  Widget _buildCurrencyDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Currency UoM',
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

  Widget _buildStatusDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Status',
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