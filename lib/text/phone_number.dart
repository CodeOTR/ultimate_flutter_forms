import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({Key? key}) : super(key: key);

  @override
  _PhoneNumberFieldState createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  final _controller = TextEditingController();
  String? _errorText;
  int _previousLength = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleTextChange);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Phone Number',
        hintText: '(XXX) XXX-XXXX',
        errorText: _errorText,
      ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(14),
        FilteringTextInputFormatter.allow(RegExp(r'^[\d()\-\s]{0,14}$')),
      ],
      keyboardType: TextInputType.phone,
      onChanged: (value) {
        setState(() {
          if (_isValidPhoneNumber(value)) {
            _errorText = null;
          } else {
            _errorText = 'Please enter a valid phone number';
          }
        });
      },
    );
  }

  void _handleTextChange() {
    int currentLength = _controller.text.length;

    if (currentLength == 3 && _previousLength == 2 && !_controller.text.startsWith('(')) {
      _controller.text = '(${_controller.text}) ';
      _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
    } else if (currentLength == 6 && _previousLength == 5 && (!_controller.text.contains(') ') && !_controller.text.trim().contains(')'))) {
      _controller.text = '${_controller.text.substring(0, 4)}) ${_controller.text.substring(4)}';
      _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
    } else if (currentLength == 6 && _previousLength == 5 && _controller.text.trim().contains(')')) {
      _controller.text = '${_controller.text.substring(0, 5)} ${_controller.text.substring(5)}';
      _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
    } else if (currentLength == 9 && _previousLength == 8 && !_controller.text.contains('-')) {
      _controller.text = '${_controller.text}-';
      _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
    }
    // Else if length is greater than 9 and there is no dash, add the dash
    else if (currentLength > 9 && !_controller.text.contains('-')) {
      _controller.text = '${_controller.text.substring(0, 9)}-${_controller.text.substring(9)}';
      _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
    }

    _previousLength = currentLength;
  }

  bool _isValidPhoneNumber(String value) {
    return RegExp(r'^\(\d{3}\) \d{3}-\d{4}$').hasMatch(value);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTextChange);
    _controller.dispose();
    super.dispose();
  }
}

class PhoneInputFormatter extends TextInputFormatter {
  int _previousLength = 0;
  static const int _maxLength = 14; // Maximum length for the format (XXX) XXX-XXXX

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    int currentLength = newValue.text.length;

    // If the new value is empty, allow it (to handle backspace)
    if (newValue.text.isEmpty) {
      _previousLength = 0;
      return newValue;
    }

    // If the new value exceeds the maximum length, return the old value
    if (currentLength > _maxLength) {
      return oldValue;
    }

    String newText = newValue.text;

    if (currentLength == 3 && _previousLength == 2 && !newText.startsWith('(')) {
      newText = '($newText) ';
    } else if (currentLength == 6 && _previousLength == 5 && (!newText.contains(') ') && !newText.trim().contains(')'))) {
      newText = '${newText.substring(0, 4)}) ${newText.substring(4)}';
    } else if (currentLength == 6 && _previousLength == 5 && newText.trim().contains(')')) {
      newText = '${newText.substring(0, 5)} ${newText.substring(5)}';
    } else if (currentLength == 9 && _previousLength == 8 && !newText.contains('-')) {
      newText = '$newText-';
    } else if (currentLength > 9 && !newText.contains('-')) {
      newText = '${newText.substring(0, 9)}-${newText.substring(9)}';
    }

    _previousLength = currentLength;

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

