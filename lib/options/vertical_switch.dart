import 'package:flutter/material.dart';

class VerticalSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  VerticalSwitch({required this.value, this.onChanged});

  @override
  _VerticalSwitchState createState() => _VerticalSwitchState();
}

class _VerticalSwitchState extends State<VerticalSwitch> {
  bool _currentValue = false;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onChanged != null) {
          widget.onChanged!(!_currentValue);
        }
        setState(() {
          _currentValue = !_currentValue;
        });
      },
      child: Transform.rotate(
        angle: -1.5708, // -90 degrees in radians
        child: Switch(
          value: _currentValue,
          onChanged: (bool value) {
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
            setState(() {
              _currentValue = value;
            });
          },
        ),
      ),
    );
  }
}
