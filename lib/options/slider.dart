import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final ValueChanged<double>? onValueChanged;

  const SliderWidget({
    Key? key,
    required this.minValue,
    required this.maxValue,
    this.onValueChanged,
  }) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double? _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.minValue; // Initialize with the minimum value
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentValue ?? widget.minValue,
      onChanged: (double newValue) {
        setState(() {
          _currentValue = newValue;
        });
        if (widget.onValueChanged != null) {
          widget.onValueChanged!(_currentValue ?? widget.minValue);
        }
      },
      min: widget.minValue,
      max: widget.maxValue,
      divisions: (widget.maxValue - widget.minValue).toInt(),
      label: '$_currentValue',
    );
  }
}
