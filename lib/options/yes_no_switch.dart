import 'package:flutter/material.dart';

class YesNoSwitch extends StatefulWidget {
  final ValueChanged<bool>? onChanged;

  const YesNoSwitch({Key? key, this.onChanged}) : super(key: key);

  @override
  _YesNoSwitchState createState() => _YesNoSwitchState();
}

class _YesNoSwitchState extends State<YesNoSwitch> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('No'),
        Switch(
          value: _isSwitched,
          onChanged: (value) {
            setState(() {
              _isSwitched = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(_isSwitched);
            }
          },
        ),
        const Text('Yes'),
      ],
    );
  }
}
