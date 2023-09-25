import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ultimate_flutter_forms/text/utils.dart';

class FirstNameField extends StatefulWidget {
  const FirstNameField({super.key});

  @override
  FirstNameFieldState createState() => FirstNameFieldState();
}

class FirstNameFieldState extends State<FirstNameField> {
  final _controller = TextEditingController();
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'First Name',
        hintText: 'Enter your first name',
        errorText: _errorText,
      ),
      autofillHints: const [AutofillHints.givenName],
      textCapitalization: TextCapitalization.words,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
      ],
      onChanged: (value) {
        setState(() {
          if (_isValidFirstName(value)) {
            _errorText = null;
          } else {
            _errorText = 'Please enter a valid first name';
          }
        });
      },
    );
  }

  bool _isValidFirstName(String value) {
    // Check if the value is alphabetic and not empty
    return value.isNotEmpty && value.isAlphabetic;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
