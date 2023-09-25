import 'package:flutter/material.dart';
import 'package:ultimate_flutter_forms/text/first_name.dart';
import 'package:ultimate_flutter_forms/text/zip_code.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: ZipCodeField(isExtendedFormat: true),
          ),
        ),
      ),
    );
  }
}
