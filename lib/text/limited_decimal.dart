import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LimitedDecimal extends StatefulWidget {
  final bool allowNegative;
  final int decimalPlaces;

  const LimitedDecimal({Key? key, this.allowNegative = true, this.decimalPlaces = 2}) : super(key: key);

  @override
  _LimitedDecimalState createState() => _LimitedDecimalState();
}

class _LimitedDecimalState extends State<LimitedDecimal> {
  final _controller = TextEditingController();
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Decimal Value',
        hintText: 'Enter decimal value',
        errorText: _errorText,
      ),
      keyboardType: TextInputType.numberWithOptions(decimal: true, signed: widget.allowNegative),
      inputFormatters: _inputFormatters(),
      onChanged: (value) {
        setState(() {
          if (_isValidDecimal(value)) {
            _errorText = null;
          } else {
            _errorText = 'Please enter a valid decimal value';
          }
        });
      },
    );
  }

  List<TextInputFormatter> _inputFormatters() {
    String pattern = widget.allowNegative ? r'^-?\d*\.?\d{0,' + widget.decimalPlaces.toString() + r'}$' : r'^\d*\.?\d{0,' + widget.decimalPlaces.toString() + r'}$';
    return [
      FilteringTextInputFormatter.allow(RegExp(pattern)),
    ];
  }

  bool _isValidDecimal(String value) {
    String pattern = widget.allowNegative ? r'^-?\d*\.?\d{0,' + widget.decimalPlaces.toString() + r'}$' : r'^\d*\.?\d{0,' + widget.decimalPlaces.toString() + r'}$';
    return RegExp(pattern).hasMatch(value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
class LimitedDecimalInputFormatter extends TextInputFormatter {
  final bool allowNegative;
  final int decimalPlaces;

  LimitedDecimalInputFormatter({this.allowNegative = true, this.decimalPlaces = 2});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String pattern = allowNegative ? r'^-?\d*\.?\d{0,' + decimalPlaces.toString() + r'}$' : r'^\d*\.?\d{0,' + decimalPlaces.toString() + r'}$';
    RegExp regExp = RegExp(pattern);

    // If the new value doesn't match the pattern, return the old value
    if (!regExp.hasMatch(newValue.text)) {
      return oldValue;
    }

    return newValue;
  }
}
