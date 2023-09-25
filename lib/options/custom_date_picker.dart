import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  final ValueChanged<DateTime?>? onDateSelected;

  const CustomDatePicker({Key? key, this.onDateSelected}) : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(_selectedDate == null
          ? 'Select a Date'
          : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'),
      onPressed: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now().add(const Duration(days: 365 * 10)), // for example, 10 years into the future
        );
        if (pickedDate != null && pickedDate != _selectedDate) {
          setState(() {
            _selectedDate = pickedDate;
          });
          if (widget.onDateSelected != null) {
            widget.onDateSelected!(_selectedDate);
          }
        }
      },
    );
  }
}
