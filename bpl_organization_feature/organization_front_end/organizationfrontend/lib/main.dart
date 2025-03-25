import 'package:flutter/material.dart';

void  main() {
  runApp(LogisticsApp());
}

class LogisticsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogisticsDashboard(),
    );
  }
}

class LogisticsDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BPL Cargo Logistics'),
        backgroundColor: Colors.blue[900],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('B & P Logistics', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            ...['Home', 'Setup', 'Booking', 'Invoice', 'People', 'Company', 'Job', 'Status', 'Tracking', 'Clearance', 'Receipts', 'Payments', 'Accounts', 'Reports', 'Contact Us']
                .map((title) => ListTile(title: Text(title), onTap: () {}))
                .toList(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.blue[100],
              child: Text('Dashboard', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: ['Organizations', 'Addresses', 'Telephone', 'Units of Measure', 'Shipment Type', 'Agent Type', 'Facility', 'Shipment Box', 'Shipment Method', 'Facility Type', 'Facility Group', 'Users', 'Geo Tracking']
                  .map((title) => ElevatedButton(onPressed: () {}, child: Text(title)))
                  .toList(),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Organization', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    TextField(decoration: InputDecoration(labelText: 'ID')),
                    TextField(decoration: InputDecoration(labelText: 'Name')),
                    TextField(decoration: InputDecoration(labelText: 'Description')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(onPressed: () {}, child: Text('Save')),
                        SizedBox(width: 10),
                        OutlinedButton(onPressed: () {}, child: Text('Cancel')),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: ['ID', 'External ID', 'Name', 'Description', 'Admin', 'Organization Type', 'Organization Group', 'Parent Organization', 'Actions']
                    .map((title) => DataColumn(label: Text(title)))
                    .toList(),
                rows: List.generate(
                  10,
                  (index) => DataRow(
                    cells: List.generate(
                      9,
                      (i) => DataCell(Text('Sample Data')),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
