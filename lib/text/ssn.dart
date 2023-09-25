import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SSNField extends StatefulWidget {
  const SSNField({Key? key}) : super(key: key);

  @override
  _SSNFieldState createState() => _SSNFieldState();
}

class _SSNFieldState extends State<SSNField> {
  final _controller = TextEditingController();
  String? _errorText;
  bool _obscureText = true;
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
        labelText: 'SSN',
        hintText: 'XXX-XX-XXXX',
        errorText: _errorText,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _toggleSSNVisibility,
        ),
      ),
      keyboardType: TextInputType.number,
      obscureText: _obscureText,
      inputFormatters: [
        LengthLimitingTextInputFormatter(11), // Moved to the first position
        FilteringTextInputFormatter.deny(RegExp(r'\s|[a-zA-Z]')), // Prevent whitespace and alphabetical characters
        FilteringTextInputFormatter.allow(RegExp(r'^\d{0,3}[-]?\d{0,2}[-]?\d{0,4}$')),
      ],
      onChanged: (value) {
        setState(() {
          if (_isValidSSN(value)) {
            _errorText = null;
          } else {
            _errorText = 'Please enter a valid SSN';
          }
        });
      },
    );
  }

  void _handleTextChange() {
    int currentLength = _controller.text.length;

    if (currentLength == 3 && _previousLength == 2 && !_controller.text.contains('-')) {
      _controller.text = '${_controller.text}-';
      _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
    } else if (currentLength == 6 && _previousLength == 5 && !_controller.text.substring(4).contains('-')) {
      _controller.text = '${_controller.text}-';
      _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
    }
    // else if length is greater than 4 and there is no dash add it
    else if (currentLength >= 4 && !_controller.text.contains('-')) {
      _controller.text = '${_controller.text.substring(0, 3)}-${_controller.text.substring(3)}';
      _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
    }

    // else if the length is greater than 7 and there is no dash add it
    else if (currentLength >= 7 && !_controller.text.substring(5).contains('-')) {
      _controller.text = '${_controller.text.substring(0, 6)}-${_controller.text.substring(6)}';
      _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
    }

    _previousLength = currentLength;
  }

  bool _isValidSSN(String value) {
    return RegExp(r'^\d{3}-\d{2}-\d{4}$').hasMatch(value);
  }

  void _toggleSSNVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTextChange);
    _controller.dispose();
    super.dispose();
  }
}

class SSNInputFormatter extends TextInputFormatter {
  int _previousLength = 0;
  static const int _maxLength = 11; // Maximum length for the format XXX-XX-XXXX

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    int currentLength = newValue.text.length;

    // If the new value is empty, allow it (to handle backspace)
    if (newValue.text.isEmpty) {
      _previousLength = 0;
      return newValue;
    }

    // If the new value starts with a dash or doesn't match the pattern, return the old value
    if (newValue.text.startsWith('-') || !_isValidFormat(newValue.text)) {
      return oldValue;
    }

    String newText = newValue.text;

    if (currentLength == 3 && _previousLength == 2 && !newText.contains('-')) {
      newText = '$newText-';
    } else if (currentLength == 5 && _previousLength == 4 && newText.endsWith('--')) {
      newText = newText.substring(0, 4);
    } else if (currentLength == 6 && _previousLength == 5 && !newText.substring(4).contains('-')) {
      newText = '$newText-';
    } else if (currentLength >= 4 && !newText.contains('-')) {
      newText = '${newText.substring(0, 3)}-${newText.substring(3)}';
    } else if (currentLength >= 7 && !newText.substring(5).contains('-')) {
      newText = '${newText.substring(0, 6)}-${newText.substring(6)}';
    }

    _previousLength = currentLength;

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  bool _isValidFormat(String value) {
    // This regex ensures that the input is in the process of matching the SSN format without consecutive dashes
    RegExp regExp = RegExp(r'^\d{1,3}(-?\d{0,2}(-?\d{0,4})?)?$');
    return regExp.hasMatch(value);
  }
}
