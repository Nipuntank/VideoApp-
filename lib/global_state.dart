import 'dart:core';

class GlobalState {
  static String? zipFilePath;
  static String? enteredText =
      "#ETH/USDT\n🟢 LONG\n✅ Entry: 2075\n🔰 Leverage : Cross 30X";
  static String? matchedText;
  static String? vidNumber = '99';
  static String? openOrdersCount = '99';
  static const String apiIP = '13.200.86.147';
  // static const String apiIP = '10.0.2.2';

  static String extractCurrencyPair(String text) {
    RegExp regExp = RegExp(r'#(\w+)/(\w+)');
    Match? match = regExp.firstMatch(text);
    if (match != null) {
      return match.group(1)! + match.group(2)!;
    } else {
      return '';
    }
  }
}
