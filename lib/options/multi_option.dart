import 'package:flutter/material.dart';

class MultiOptionWidget extends StatefulWidget {
  final List<String> options;
  final ValueChanged<String>? onOptionSelected;
  final String initialValue;
  final bool useDialog;

  const MultiOptionWidget({
    Key? key,
    required this.options,
    this.onOptionSelected,
    this.initialValue = '',
    this.useDialog = false,
  }) : super(key: key);

  @override
  _MultiOptionWidgetState createState() => _MultiOptionWidgetState();
}

class _MultiOptionWidgetState extends State<MultiOptionWidget> {
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Choose Option'),
      onPressed: widget.useDialog ? _showOptionsDialog : _showOptionsModal,
    );
  }

  void _showOptionsModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return _buildOptionsList();
      },
    );
  }

  void _showOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Option'),
          content: Container(
            width: double.maxFinite,
            child: _buildOptionsList(),
          ),
        );
      },
    );
  }

  Widget _buildOptionsList() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: widget.options.map((option) {
        return ListTile(
          title: Text(option),
          leading: Radio<String>(
            value: option,
            groupValue: _selectedOption,
            onChanged: (String? value) {
              setState(() {
                _selectedOption = value!;
              });
              if (widget.onOptionSelected != null) {
                widget.onOptionSelected!(_selectedOption!);
              }
              Navigator.pop(context);
            },
          ),
        );
      }).toList(),
    );
  }
}
