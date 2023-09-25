import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DecimalField extends StatefulWidget {
  final bool allowNegative;

  const DecimalField({Key? key, this.allowNegative = true}) : super(key: key);

  @override
  _DecimalFieldState createState() => _DecimalFieldState();
}

class _DecimalFieldState extends State<DecimalField> {
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
    if (widget.allowNegative) {
      return [
        FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*$')), // Allow negative decimals
      ];
    } else {
      return [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')), // Only positive decimals
      ];
    }
  }

  bool _isValidDecimal(String value) {
    if (widget.allowNegative) {
      return RegExp(r'^-?\d*\.?\d*$').hasMatch(value);
    } else {
      return RegExp(r'^\d*\.?\d*$').hasMatch(value);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
