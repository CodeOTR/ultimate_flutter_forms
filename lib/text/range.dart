import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RangeField extends StatefulWidget {
  final int min;
  final int max;

  const RangeField({
    Key? key,
    required this.min,
    required this.max,
  }) : super(key: key);

  @override
  _RangeFieldState createState() => _RangeFieldState();
}

class _RangeFieldState extends State<RangeField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Enter a number',
        hintText: '${widget.min} - ${widget.max}',
        errorText: _validateRange(_controller.text),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: (value) {
        setState(() {}); // To trigger a rebuild and show/hide the error message
      },
    );
  }

  String? _validateRange(String value) {
    if (value.isEmpty) return null;

    int? number = int.tryParse(value);
    if (number == null) return 'Please enter a valid number';

    if (number < widget.min || number > widget.max) {
      return 'Number must be between ${widget.min} and ${widget.max}';
    }

    return null;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
