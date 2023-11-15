import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  static const int maxFormattedLength = 16;
  static const List<int> spacePositions = [3, 6, 10, 13];

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    final StringBuffer newText = StringBuffer();
    int index = 0;

    for (int i = 0; i < digitsOnly.length; i++) {
      if (index >= maxFormattedLength) {
        break;
      }

      if (spacePositions.contains(index)) {
        newText.write(' ');
        index++;
      }

      newText.write(digitsOnly[i]);
      index++;
    }

    final String formattedValue = newText.toString();
    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}
