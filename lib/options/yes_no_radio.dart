import 'package:flutter/material.dart';

class YesNoRadio extends StatefulWidget {
  final ValueChanged<bool?>? onChanged;

  const YesNoRadio({Key? key, this.onChanged}) : super(key: key);

  @override
  _YesNoRadioState createState() => _YesNoRadioState();
}

class _YesNoRadioState extends State<YesNoRadio> {
  bool? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<bool>(
          value: true,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(_selectedValue);
            }
          },
        ),
        const Text('Yes'),
        Radio<bool>(
          value: false,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(_selectedValue);
            }
          },
        ),
        const Text('No'),
      ],
    );
  }
}
