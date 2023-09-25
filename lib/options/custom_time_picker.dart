import 'package:flutter/material.dart';

class CustomTimePicker extends StatefulWidget {
  final ValueChanged<TimeOfDay>? onTimeSelected;

  const CustomTimePicker({Key? key, this.onTimeSelected}) : super(key: key);

  @override
  _CustomTimePickerState createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  int _selectedHour = 0;
  int _selectedMinute = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Hours dropdown
        DropdownButton<int>(
          value: _selectedHour,
          items: List.generate(24, (index) {
            return DropdownMenuItem<int>(
              value: index,
              child: Text(index.toString().padLeft(2, '0')),
            );
          }),
          onChanged: (int? newValue) {
            setState(() {
              _selectedHour = newValue!;
            });
            _notifyTimeChange();
          },
        ),
        const Text(':'),
        // Minutes dropdown
        DropdownButton<int>(
          value: _selectedMinute,
          items: List.generate(60, (index) {
            return DropdownMenuItem<int>(
              value: index,
              child: Text(index.toString().padLeft(2, '0')),
            );
          }),
          onChanged: (int? newValue) {
            setState(() {
              _selectedMinute = newValue!;
            });
            _notifyTimeChange();
          },
        ),
      ],
    );
  }

  void _notifyTimeChange() {
    if (widget.onTimeSelected != null) {
      widget.onTimeSelected!(TimeOfDay(hour: _selectedHour, minute: _selectedMinute));
    }
  }
}
