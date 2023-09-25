import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CVVField extends StatefulWidget {
  final bool isAmex; // American Express cards have 4-digit CVVs

  const CVVField({Key? key, this.isAmex = false}) : super(key: key);

  @override
  _CVVFieldState createState() => _CVVFieldState();
}

class _CVVFieldState extends State<CVVField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.number,
      maxLength: widget.isAmex ? 4 : 3,
      decoration: const InputDecoration(
        labelText: 'CVV',
        counterText: '', // Hide the counter, but still use maxLength
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(widget.isAmex ? 4 : 3),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CVVInputFormatter extends TextInputFormatter {
  final bool isAmex; // American Express cards have 4-digit CVVs

  CVVInputFormatter({this.isAmex = false});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // Ensure the CVV contains only digits
    if (!RegExp(r'^\d*$').hasMatch(newText)) {
      return oldValue;
    }

    // Ensure the CVV does not exceed the maximum length (3 or 4 digits)
    if (newText.length > (isAmex ? 4 : 3)) {
      return oldValue;
    }

    return newValue;
  }
}

