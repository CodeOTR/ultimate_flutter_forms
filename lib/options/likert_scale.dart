import 'package:flutter/material.dart';

class LikertScale extends StatefulWidget {
  final String question;
  final List<String> options;

  LikertScale({required this.question, this.options = const ["Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree"]});

  @override
  _LikertScaleState createState() => _LikertScaleState();
}

class _LikertScaleState extends State<LikertScale> {
  int? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.question, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ...List.generate(widget.options.length, (index) {
          return ListTile(
            title: Text(widget.options[index]),
            leading: Radio<int>(
              value: index,
              groupValue: _selectedValue,
              onChanged: (int? value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
          );
        }),
      ],
    );
  }
}
