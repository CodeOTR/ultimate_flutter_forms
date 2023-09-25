import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LastNameField extends StatefulWidget {
  const LastNameField({super.key});

  @override
  _LastNameFieldState createState() => _LastNameFieldState();
}

class _LastNameFieldState extends State<LastNameField> {
  final _controller = TextEditingController();
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Last Name',
        hintText: 'Enter your last name',
        errorText: _errorText,
      ),
      autofillHints: const [AutofillHints.familyName],
      
      textCapitalization: TextCapitalization.words,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))],
      onChanged: (value) {
        setState(() {
          if (value.isNotEmpty) {
            _errorText = null;
          } else {
            _errorText = 'Please enter a valid last name';
          }
        });
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
