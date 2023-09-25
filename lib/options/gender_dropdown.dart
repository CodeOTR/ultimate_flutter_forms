import 'package:flutter/material.dart';

class GenderDropdown extends StatefulWidget {
  final ValueChanged<String?>? onChanged;

  const GenderDropdown({Key? key, this.onChanged}) : super(key: key);

  @override
  _GenderDropdownState createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  String? _selectedGender;
  final List<String> _genders = ['Male', 'Female', 'Non-Binary', 'Prefer Not to Say'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedGender,
      hint: const Text('Select a gender'),
      items: _genders.map((String gender) {
        return DropdownMenuItem<String>(
          value: gender,
          child: Text(gender),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedGender = newValue;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(_selectedGender);
        }
      },
    );
  }
}
