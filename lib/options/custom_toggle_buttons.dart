import 'package:flutter/material.dart';

class CustomToggleButtons extends StatefulWidget {
  @override
  _CustomToggleButtonsState createState() => _CustomToggleButtonsState();
}

class _CustomToggleButtonsState extends State<CustomToggleButtons> {
  List<bool> _isSelected = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.call),
        Icon(Icons.cake),
      ],
      onPressed: (int index) {
        setState(() {
          _isSelected[index] = !_isSelected[index];
        });
      },
      isSelected: _isSelected,
      color: Colors.grey,
      selectedColor: Colors.blue,
      fillColor: Colors.blue.withOpacity(0.1),
      borderRadius: BorderRadius.circular(8.0),
    );
  }
}
