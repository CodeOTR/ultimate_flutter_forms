import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IPv4Field extends StatefulWidget {
  const IPv4Field({Key? key}) : super(key: key);

  @override
  _IPv4FieldState createState() => _IPv4FieldState();
}

class _IPv4FieldState extends State<IPv4Field> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'IPv4 Address',
        hintText: '192.168.1.1',
      ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(15),
        FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class IPv4InputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;

    // Ensure only digits and periods are allowed
    if (!RegExp(r'^[\d.]*$').hasMatch(newText)) {
      return oldValue;
    }

    // Automatically insert a period after 3 consecutive numbers
    RegExp exp = RegExp(r'(\d{3})(?=\d)');
    while (exp.hasMatch(newText)) {
      newText = newText.replaceFirstMapped(exp, (match) => '${match.group(1)}.');
    }

    // Prevent consecutive periods
    if (newText.contains('..')) {
      return oldValue;
    }

    // Do not allow more than 4 segments
    if (newText.split('.').length > 4) {
      return oldValue;
    }

    // Split the IP address into its segments
    final segments = newText.split('.');

    // Check each segment to ensure it's <= 255
    for (var segment in segments) {
      if (int.tryParse(segment) != null && int.parse(segment) > 255) {
        return oldValue;
      }
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
