import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final _controller = TextEditingController();
  bool _obscureText = true;
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        errorText: _errorText,
        errorMaxLines: 2,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _togglePasswordVisibility,
        ),
      ),
      obscureText: _obscureText,
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))], // Prevent whitespace
      autofillHints: const [AutofillHints.password],
      onChanged: (value) {
        setState(() {
          if (_isValidPassword(value)) {
            _errorText = null;
          } else {
            _errorText = 'Password must be at least 8 characters, contain a number and a special character';
          }
        });
      },
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _isValidPassword(String value) {
    // Example validation: Passwords should be at least 8 characters, contain a number and a special character.
    // Adjust this regex to fit your password policy.
    return RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$').hasMatch(value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
