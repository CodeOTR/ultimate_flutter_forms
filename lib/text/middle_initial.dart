import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MiddleInitialField extends StatefulWidget {
  const MiddleInitialField({Key? key}) : super(key: key);

  @override
  _MiddleInitialFieldState createState() => _MiddleInitialFieldState();
}

class _MiddleInitialFieldState extends State<MiddleInitialField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: const InputDecoration(
        labelText: 'Middle Initial',
        hintText: 'M',
      ),
      maxLength: 1,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')), // Only allow alphabetic characters
      ],
    );
  }
}

class MiddleInitialInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // If the new value is empty, allow it (to handle backspace)
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // If the new value is a single alphabetic character, allow it
    if (newValue.text.length == 1 && RegExp(r'^[a-zA-Z]$').hasMatch(newValue.text)) {
      return newValue;
    }

    // Otherwise, return the old value
    return oldValue;
  }
}
