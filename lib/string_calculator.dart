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

    final numberStrings = numbersSection.split(delimiter).map((n) => n.trim()).toList();
    final numbers = numberStrings.map(int.parse).toList();
    final negatives = numbers.where((n) => n < 0).toList();

    if (negatives.isNotEmpty) {
      throw FormatException("negative numbers not allowed: ${negatives.join(',')}");
    }

    return numbers.where((currentValue) => currentValue <= 1000).fold(0, (initialValue, currentValue) => initialValue + currentValue);
  }
}
