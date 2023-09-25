import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  final _controller = TextEditingController();
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'example@example.com',
        errorText: _errorText,
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        setState(() {
          if (_isValidEmail(value)) {
            _errorText = null;
          } else {
            _errorText = 'Please enter a valid email address';
          }
        });
      },
    );
  }

  bool _isValidEmail(String value) {
    // This regex checks for a basic valid email format.
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
