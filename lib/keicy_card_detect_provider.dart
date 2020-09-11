library keicy_card_detect_provider;

import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardDetectProvider extends ChangeNotifier {
  static CardDetectProvider of(BuildContext context, {bool listen = false}) => Provider.of<CardDetectProvider>(context, listen: listen);

  String _typeString = "unknown";
  String get typeString => _typeString;

  CreditCardType _cardType;
  CreditCardType get cardType => _cardType;

  void detectCardType(String number) {
    number = number.replaceAll(" ", "");
    CreditCardType cardType = detectCCType(number);
    if (_cardType != cardType) {
      _cardType = cardType;
      _typeString = cardType.toString().split('.')[1];
      notifyListeners();
    }
  }
}
