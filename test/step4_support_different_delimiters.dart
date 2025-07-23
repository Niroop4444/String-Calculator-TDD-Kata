import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator_tdd/string_calculator.dart';

void main() {
  group("Step4. Support different delimiters", () {
    final calculator = StringCalculator();

    test('Supports for custom delimiter such as // ;', () {
      expect(calculator.add("//;\n1;2"), 3);
    });

    test('Supports custom delimiter such as hash with input', () {
      expect(calculator.add("//#\n10#20#30"), 60);
    });

    test('Supports custom delimiter such as -', () {
      expect(calculator.add("//-\n4-5-6"), 15);
    });

    test('Throws FormatException for invalid delimiter declaration in the end, as it is converted into empty string', () {
      expect(() => calculator.add("//;\n1;2;"), throwsFormatException);
    });
  });
}