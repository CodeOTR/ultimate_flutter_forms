extension StringValidation on String {
  bool get isAlphabetic => split('').every((c) => RegExp(r'^[a-zA-Z]+$').hasMatch(c));

  bool get isNumeric => split('').every((c) => RegExp(r'^[0-9]+$').hasMatch(c));

// Add more utility extensions as needed
}
