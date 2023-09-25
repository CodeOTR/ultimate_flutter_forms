import 'package:flutter/material.dart';

class CustomMultiCheckbox extends StatefulWidget {
  @override
  _CustomMultiCheckboxState createState() => _CustomMultiCheckboxState();
}

class _CustomMultiCheckboxState extends State<CustomMultiCheckbox> {
  final Map<String, bool> _checkboxValues = {
    'Option 1': false,
    'Option 2': false,
    'Option 3': false,
    'Option 4': false,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _checkboxValues.keys.map((String key) {
        return CheckboxListTile(
          title: Text(key),
          value: _checkboxValues[key],
          onChanged: (bool? value) {
            setState(() {
              _checkboxValues[key] = value!;
            });
          },
        );
      }).toList(),
    );
  }
}
