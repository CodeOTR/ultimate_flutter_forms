import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ZipCodeField extends StatefulWidget {
  final bool isExtendedFormat;

  const ZipCodeField({Key? key, this.isExtendedFormat = false}) : super(key: key);

  @override
  _ZipCodeFieldState createState() => _ZipCodeFieldState();
}

class _ZipCodeFieldState extends State<ZipCodeField> {
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
        labelText: 'Zip Code',
        hintText: 'Enter your zip code',
        errorText: _errorText,
        counterText: '', // Hide the counter, even though maxLength is set
      ),
      inputFormatters: [
        // Deny whitespace and alphabetical characters
        FilteringTextInputFormatter.deny(RegExp(r'\s|[a-zA-Z]')),
        // Only allow 5 digits, or 10 digits if extended format is enabled
        LengthLimitingTextInputFormatter(widget.isExtendedFormat ? 10 : 5),
        FilteringTextInputFormatter.allow(
          widget.isExtendedFormat ? RegExp(r'^\d{0,5}([-]?\d{0,4})?$') : RegExp(r'^\d{0,5}$'),
        )
      ],
      keyboardType: TextInputType.number,
      maxLength: widget.isExtendedFormat ? 10 : 5,
      onChanged: (value) {
        setState(() {
          if (_isValidZipCode(value)) {
            _errorText = null;
          } else {
            _errorText = widget.isExtendedFormat
                ? 'Please enter a valid zip code in 5-4 format'
                : 'Please enter a valid 5-digit zip code';
          }
        });
      },
    );
  }

  void _handleTextChange() {
    int currentLength = _controller.text.length;

    if (widget.isExtendedFormat && currentLength == 5 && _previousLength == 4) {
      _controller.text = '${_controller.text}-';
      _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
    }

    _previousLength = currentLength;
  }


  bool _isValidZipCode(String value) {
    return widget.isExtendedFormat
        ? RegExp(r'^\d{5}([-]\d{4})?$').hasMatch(value)
        : RegExp(r'^\d{5}$').hasMatch(value);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTextChange);
    _controller.dispose();
    super.dispose();
  }
}
