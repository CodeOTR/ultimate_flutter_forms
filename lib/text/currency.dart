import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyField extends StatefulWidget {
  final String currencySymbol;
  final bool usePrefixText;

  const CurrencyField({Key? key, this.currencySymbol = '\$', this.usePrefixText = true}) : super(key: key);

  @override
  _CurrencyFieldState createState() => _CurrencyFieldState();
}

class _CurrencyFieldState extends State<CurrencyField> {
  final _controller = TextEditingController();
  late NumberFormat _numberFormat;

  @override
  void initState() {
    super.initState();
    _numberFormat = NumberFormat.currency(
      symbol: widget.usePrefixText ? '' : widget.currencySymbol,
      decimalDigits: 2,
    );
    //_controller.addListener(_handleTextChange);
  }

  void _handleTextChange() {
    String text = _controller.text;
    text = text.replaceAll(widget.currencySymbol, '').replaceAll(',', '');

    // If the user is typing a decimal, allow it without formatting
    if (text == '.' || text.endsWith('.') || (text.split('.').length > 1 && text.split('.')[1].length < 2)) {
      return;
    }

    if (text.isNotEmpty) {
      double? value = double.tryParse(text);
      if (value != null) {
        _controller.value = TextEditingValue(
          text: _numberFormat.format(value),
          selection: TextSelection.collapsed(offset:_numberFormat.format(value).length),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
      ],
      decoration: InputDecoration(
        labelText: 'Amount',
        prefixText: widget.usePrefixText ? widget.currencySymbol : null,
      ),
      onEditingComplete: () {
        // Format the text when the user moves away from the field
        _handleTextChange();
      },
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTextChange);
    _controller.dispose();
    super.dispose();
  }
}


class CurrencyInputFormatter extends TextInputFormatter {
  final String currencySymbol;
  final bool usePrefixText;

  CurrencyInputFormatter({this.currencySymbol = '\$', this.usePrefixText = true});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    newText = newText.replaceAll(currencySymbol, '').replaceAll(',', '');

    if (newText == '.' || newText.endsWith('.') || newText.split ('.').length == 1 || newText.split('.').length > 1 && newText.split('.')[1].length < 2) {
      return newValue;
    }

    if (newText.isNotEmpty) {
      double? value = double.tryParse(newText);
      if (value != null) {
        NumberFormat numberFormat = NumberFormat.currency(
          symbol: usePrefixText ? '' : currencySymbol,
          decimalDigits: 2,
        );
        String formattedText = numberFormat.format(value);

        return TextEditingValue(
          text: formattedText,
          selection: TextSelection.collapsed(offset: formattedText.length),
        );
      }
    }

    return newValue;
  }
}

