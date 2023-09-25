import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuantityField extends StatefulWidget {
  final bool allowNegative;

  const QuantityField({Key? key, this.allowNegative = false}) : super(key: key);

  @override
  _QuantityFieldState createState() => _QuantityFieldState();
}

class _QuantityFieldState extends State<QuantityField> {
  final _controller = TextEditingController();
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Quantity',
        hintText: 'Enter quantity',
        errorText: _errorText,
      ),
      keyboardType: TextInputType.numberWithOptions(signed: widget.allowNegative),
      inputFormatters: _inputFormatters(widget.allowNegative),
      onChanged: (value) {
        setState(() {
          if (_isValidQuantity(value)) {
            _errorText = null;
          } else {
            _errorText = 'Please enter a valid quantity';
          }
        });
      },
    );
  }

  List<TextInputFormatter> _inputFormatters(bool allowNegative) {
    if (allowNegative) {
      return [
        LengthLimitingTextInputFormatter(11), // Account for the negative sign
        FilteringTextInputFormatter.allow(RegExp(r'[-]?\d*$')), // Allow negative integers
      ];
    } else {
      return [
        LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.digitsOnly,
        FilteringTextInputFormatter.allow(RegExp(r'^[1-9]\d*$')), // Only positive integers
      ];
    }
  }

  bool _isValidQuantity(String value) {
    if (widget.allowNegative) {
      return RegExp(r'^-?[1-9]\d*$').hasMatch(value);
    } else {
      return RegExp(r'^[1-9]\d*$').hasMatch(value);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class QuantityInputFormatter extends TextInputFormatter {
  final bool allowNegative;

  QuantityInputFormatter({this.allowNegative = false});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String pattern = allowNegative ? r'^-?\d*$' : r'^\d*$';
    RegExp regExp = RegExp(pattern);

    // If the new value doesn't match the pattern, return the old value
    if (!regExp.hasMatch(newValue.text)) {
      return oldValue;
    }

    return newValue;
  }
}
