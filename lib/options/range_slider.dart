import 'package:flutter/material.dart';

class CustomRangeSlider extends StatefulWidget {
  final double min;
  final double max;
  final ValueChanged<RangeValues>? onChanged;

  CustomRangeSlider({this.min = 0.0, this.max = 100.0, this.onChanged});

  @override
  _CustomRangeSliderState createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  RangeValues _currentRangeValues = RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _currentRangeValues,
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(values);
        }
      },
      min: widget.min,
      max: widget.max,
      divisions: 100,
      labels: RangeLabels(
        _currentRangeValues.start.round().toString(),
        _currentRangeValues.end.round().toString(),
      ),
    );
  }
}
