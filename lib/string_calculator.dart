class StringCalculator {

  final RegExp commaRegEx = RegExp(r',');

  int add(String input) {
    if (input.isEmpty) return 0;

    if (!input.contains(commaRegEx)) {
      return int.parse(input.trim());
    }

    final numbers = input.split(commaRegEx);

    /// Removing because of Step 2
    // if (numbers.length > 2) {
    //   throw FormatException("Only up to 2 numbers are allowed");
    // }

    if (numbers.any((n) => n.trim().isEmpty)) {
      throw FormatException("Input contains missing or invalid numbers");
    }

    return numbers.fold(0, (initialValue, currentValue) => initialValue + int.parse(currentValue));
  }
}
