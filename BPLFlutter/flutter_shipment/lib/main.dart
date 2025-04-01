import 'package:flutter/material.dart';
import 'package:flutter_shipment/widget/facility_type_form.dart';
import 'package:flutter_shipment/widget/login_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginWidget(),
      ),
    );
  }
}
