class StringCalculator {

  final RegExp commaNewLineRegEx = RegExp(r'[,\n]');

  int add(String input) {
    if (input.isEmpty) return 0;

    if (!input.contains(commaNewLineRegEx)) {
      return int.parse(input.trim());
    }

    final numbers = input.split(commaNewLineRegEx);
    /// Removing because of Step 2
    // if (numbers.length > 2) {
    //   throw FormatException("Only up to a2 numbers are allowed");
    // }

    if (numbers.any((n) => n.trim().isEmpty)) {
      throw FormatException("Input contains missing or invalid numbers");
    }

    return numbers.fold(0, (initialValue, currentValue) => initialValue + int.parse(currentValue));
  }
}
