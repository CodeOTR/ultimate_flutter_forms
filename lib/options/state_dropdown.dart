import 'package:flutter/material.dart';

class StateDropdown extends StatefulWidget {
  final ValueChanged<String?>? onChanged;

  const StateDropdown({Key? key, this.onChanged}) : super(key: key);

  @override
  _StateDropdownState createState() => _StateDropdownState();
}

class _StateDropdownState extends State<StateDropdown> {
  String? _selectedState;
  final List<String> _states = [
    'Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut',
    'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa',
    'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan',
    'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
    'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio',
    'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota',
    'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia',
    'Wisconsin', 'Wyoming'
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedState,
      hint: const Text('Select a state'),
      items: _states.map((String state) {
        return DropdownMenuItem<String>(
          value: state,
          child: Text(state),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedState = newValue;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(_selectedState);
        }
      },
    );
  }
}
