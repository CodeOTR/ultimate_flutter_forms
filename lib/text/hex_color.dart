import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HexColorField extends StatefulWidget {
  const HexColorField({Key? key}) : super(key: key);

  @override
  _HexColorFieldState createState() => _HexColorFieldState();
}

class _HexColorFieldState extends State<HexColorField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Enter Hex Color',
        hintText: '#RRGGBB or RRGGBB',
        errorText: _validateHexColor(_controller.text),
      ),
      inputFormatters: [
        // Only allow alphanumeric characters and hashes
        FilteringTextInputFormatter.allow(RegExp(r'#?[a-fA-F0-9]{0,6}')),
        LengthLimitingTextInputFormatter(_controller.text.contains('#')? 7 : 6),
      ],
      onChanged: (value) {
        setState(() {}); // To trigger a rebuild and show/hide the error message
      },
    );
  }

  String? _validateHexColor(String value) {
    if (value.isEmpty) return null;

    // Regular expression to match valid hex color values
    RegExp regex = RegExp(r'^#?([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$');
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid hex color';
    }

    return null;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class HexColorInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // Ensure the input only contains valid hex characters and is of the correct length
    if (RegExp(r'^#?[a-fA-F0-9]{0,6}$').hasMatch(newText)) {
      return newValue;
    }

    return oldValue;
  }
}

