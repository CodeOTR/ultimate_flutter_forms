import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConfirmPasswordField extends StatefulWidget {
  final TextEditingController passwordController;

  const ConfirmPasswordField({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  @override
  _ConfirmPasswordFieldState createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  final _controller = TextEditingController();
  bool _obscureText = true;
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        hintText: 'Re-enter your password',
        errorText: _errorText,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _togglePasswordVisibility,
        ),
      ),
      obscureText: _obscureText,
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))], // Prevent whitespace
      onChanged: (value) {
        setState(() {
          if (value == widget.passwordController.text) {
            _errorText = null;
          } else {
            _errorText = 'Passwords do not match';
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
