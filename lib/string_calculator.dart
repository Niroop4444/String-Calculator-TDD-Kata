class StringCalculator {

  final RegExp commaNewLineRegEx = RegExp(r'[,\n]');
  final RegExp customCommaRegEx = RegExp(r'^//(.+)\n(.*)$');

  int add(String input) {
    if (input.isEmpty) return 0;

    if (!input.contains(commaNewLineRegEx)) {
      return int.parse(input.trim());
    }

    RegExp delimiter = commaNewLineRegEx;
    String numbersSection = input;

    final customRegexMatch = customCommaRegEx.firstMatch(input);
    if (customRegexMatch != null) {
      final customDelimiter = customRegexMatch.group(1)!;
      numbersSection = customRegexMatch.group(2)!;
      delimiter = RegExp(RegExp.escape(customDelimiter));
    }

    final numbers = numbersSection.split(delimiter).map((n) => n.trim()).toList();
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
