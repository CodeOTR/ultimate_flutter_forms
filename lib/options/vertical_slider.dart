import 'package:flutter/material.dart';

class VerticalSlider extends StatefulWidget {
  final double min;
  final double max;
  final ValueChanged<double>? onChanged;

  VerticalSlider({this.min = 0.0, this.max = 1.0, this.onChanged});

  @override
  _VerticalSliderState createState() => _VerticalSliderState();
}

class _VerticalSliderState extends State<VerticalSlider> {
  double _currentValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackShape: const RoundedRectSliderTrackShape(),
        trackHeight: 2.0,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
      ),
      child: RotatedBox(
        quarterTurns: 3,
        child: Slider(
          value: _currentValue,
          onChanged: (value) {
            setState(() {
              _currentValue = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          min: widget.min,
          max: widget.max,
        ),
      ),
    );
  }
}
