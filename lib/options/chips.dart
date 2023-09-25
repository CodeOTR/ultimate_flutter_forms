import 'package:flutter/material.dart';

class ChipsWidget extends StatefulWidget {
  final List<String> options;
  final ValueChanged<String>? onOptionSelected;
  final String? initialValue;

  const ChipsWidget({
    Key? key,
    required this.options,
    this.onOptionSelected,
    this.initialValue,
  }) : super(key: key);

  @override
  _ChipsWidgetState createState() => _ChipsWidgetState();
}

class _ChipsWidgetState extends State<ChipsWidget> {
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: widget.options.map((option) {
        return ChoiceChip(
          label: Text(option),
          selected: _selectedOption == option,
          onSelected: (bool selected) {
            setState(() {
              _selectedOption = selected ? option : null;
            });
            if (widget.onOptionSelected != null) {
              widget.onOptionSelected!(_selectedOption!);
            }
          },
        );
      }).toList(),
    );
  }
}
