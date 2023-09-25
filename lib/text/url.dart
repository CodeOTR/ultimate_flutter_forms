import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class URLTextFormField extends StatefulWidget {
  const URLTextFormField({Key? key}) : super(key: key);

  @override
  _URLTextFormFieldState createState() => _URLTextFormFieldState();
}

class _URLTextFormFieldState extends State<URLTextFormField> {
  final _controller = TextEditingController();
  String? _validationText;

  String? _urlValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a URL';
    }
    if (!value.startsWith('http://') && !value.startsWith('https://')) {
      return 'URL must start with http:// or https://';
    }

    // Must include domain
    if (!value.contains('.')) {
      return 'URL must include a domain';
    }

    if (!RegExp(r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)').hasMatch(value)) {
      return 'Please enter a valid URL';
    }

    return null;
  }

  void _handleTextChanged() {
    setState(() {
      _validationText = _urlValidator(_controller.text);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleTextChanged);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.url,
      decoration: InputDecoration(
        labelText: 'URL',
        hintText: 'https://www.example.com',
        errorText: _validationText,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9-._~:/?#[\]@!$&()*+,;%=]*$')),
      ],
      validator: _urlValidator,
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTextChanged);
    _controller.dispose();
    super.dispose();
  }
}

class UrlInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // Prevent consecutive periods and slashes
    if (newText.contains('..') || newText.contains('//')) {
      return oldValue;
    }

    // Ensure the URL contains valid characters
    if (!RegExp(r'^[a-zA-Z0-9-._~:/?#[\]@!$&()*+,;%=]*$').hasMatch(newText)) {
      return oldValue;
    }

    return newValue;
  }
}
