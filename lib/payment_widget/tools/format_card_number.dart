class FormatCardNumber {
  static String format(String cardNumber) {
    cardNumber = cardNumber.replaceAll(RegExp(r'\s'), '');
    final List<String> chunks = <String>[];
    for (var i = 0; i < cardNumber.length; i += 4) {
      chunks.add(cardNumber.substring(i, i + 4));
    }
    return chunks.join('       ');
  }
}
