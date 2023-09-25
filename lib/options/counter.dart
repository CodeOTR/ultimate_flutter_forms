import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final ValueChanged<int>? onValueChanged;
  final int initialValue;

  const CounterWidget({
    Key? key,
    this.onValueChanged,
    this.initialValue = 0,
  }) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _currentValue = 0;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: _decrement,
        ),
        Text('$_currentValue'),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: _increment,
        ),
      ],
    );
  }

  void _increment() {
    setState(() {
      _currentValue++;
    });
    if (widget.onValueChanged != null) {
      widget.onValueChanged!(_currentValue);
    }
  }

  void _decrement() {
    setState(() {
      _currentValue--;
    });
    if (widget.onValueChanged != null) {
      widget.onValueChanged!(_currentValue);
    }
  }
}
