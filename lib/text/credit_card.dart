import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreditCardField extends StatefulWidget {
  const CreditCardField({Key? key}) : super(key: key);

  @override
  _CreditCardFieldState createState() => _CreditCardFieldState();
}

class _CreditCardFieldState extends State<CreditCardField> {
  final _controller = TextEditingController();
  int _previousLength = 0;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: const InputDecoration(
        labelText: 'Credit Card Number',
        hintText: 'XXXX XXXX XXXX XXXX',
      ),
      keyboardType: TextInputType.number,
      maxLength: 19,
      // 16 digits + 3 spaces
      inputFormatters: [
        LengthLimitingTextInputFormatter(19),
        FilteringTextInputFormatter.allow(RegExp(r'^\d{1,4}( \d{0,4}){0,3}?$')),
      ],
      onChanged: _handleTextChange,
    );
  }

  void _handleTextChange(String value) {
    int currentLength = value.length;

    // Check if the user is adding a character
    bool isAdding = currentLength >= _previousLength;

    if (isAdding && (currentLength == 4 || currentLength == 9 || currentLength == 14)) {
      _controller.text = '$value ';
      _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
    }

    _previousLength = currentLength;
  }
}

class CreditCardInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(' ', ''); // Remove all spaces

    // Insert spaces after every 4 digits
    for (int i = 4; i < newText.length; i += 5) {
      newText = newText.substring(0, i) + ' ' + newText.substring(i);
    }

    // If the user deleted everything, return an empty string
    if (newText.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    // If the user is deleting an empty space, allow it
    if (oldValue.text.endsWith(' ') && oldValue.text.length == newValue.text.length + 1) {
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length - 1),
      );
    }

    // If the new value doesn't match the pattern, return the old value
    if (!_isValidFormat(newText)) {
      return oldValue;
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  bool _isValidFormat(String value) {
    RegExp regExp = RegExp(r'^\d{1,4}( \d{1,4}){0,2} ?\d{0,4}?$');
    return regExp.hasMatch(value);
  }
}
