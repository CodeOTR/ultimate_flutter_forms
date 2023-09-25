import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DateField extends StatefulWidget {
  final String separator;

  const DateField({Key? key, this.separator = '/'}) : super(key: key);

  @override
  _DateFieldState createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  final _controller = TextEditingController();

  String generateDateRegex({required String separator}) {
    // Ensure the separator is either a slash, a dash, or both
    if (!['/', '-', '/-'].contains(separator)) {
      throw ArgumentError('Invalid separator. Only "/", "-", or "/-" are allowed.');
    }

    // Escape the separator if it's a slash
    String escapedSeparator = separator == '/' ? r'\/' : separator;

    // Construct the regex pattern
    String pattern = r'^(0?[1-9]|1[0-2])?';
    pattern += '([' + escapedSeparator + r'](0?[1-9]|[12][0-9]|3[01])?)?';
    pattern += '([' + escapedSeparator + r']\d{0,4})?$';

    return pattern;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Date',
        hintText: 'MM${widget.separator}DD${widget.separator}YYYY',
      ),
      keyboardType: TextInputType.datetime,
      maxLength: 10,
      // MM/dd/yyyy or MM-dd-yyyy
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
        // separator and digits
        FilteringTextInputFormatter.allow(RegExp(r'^[0-9' + widget.separator + ']*\$')),
        FilteringTextInputFormatter.allow(RegExp(generateDateRegex(separator: widget.separator))),
      ],
    );
  }
}

//10-19-1990

class DateInputFormatter extends TextInputFormatter {
  final String separator;

  DateInputFormatter({required this.separator});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // If the user deleted everything, return an empty string
    if (newText.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    // If the user is deleting a separator, allow it
    if (oldValue.text.endsWith(separator) && oldValue.text.length > newValue.text.length) {
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }

    // If the user types two separators in a row, only use the first
    newText = newText.replaceAll(separator + separator, separator);

    // If the input is greater than 2 and there is not a separator, add one
    if (newText.length > 2 && !newText.contains(separator)) {
      newText = newText.substring(0, 2) + separator + newText.substring(2);
    }

    // If the input is greater than 4 and there are not two separators, add one
    if (newText.length > 5 && newText.split(separator).length - 1 < 2) {
      newText = newText.substring(0, 5) + separator + newText.substring(5);
    }

    // Ensure months are between 1-12
    if (newText.length >= 2) {
      int month = int.tryParse(newText.split(separator)[0]) ?? 0;
      if (month < 1 || month > 12) {
        return oldValue;
      }
    }

    // Ensure days are between 1-31
    if (newText.length >= 5) {
      int day = int.tryParse(newText.split(separator)[1]) ?? 0;
      if (day < 1 || day > 31) {
        return oldValue;
      }
    }

    // If the new value doesn't match the pattern, return the old value
    if (!_isValidFormat(newText)) {
      return oldValue;
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  bool _isValidFormat(String value) {
    RegExp regExp = RegExp(r'^\d{1,2}' + separator + r'?\d{0,2}' + separator + r'?\d{0,4}$');
    return regExp.hasMatch(value);
  }
}
