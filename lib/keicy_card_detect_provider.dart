library keicy_card_detect_provider;

import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KeicyCardDetectProvider extends ChangeNotifier {
  static KeicyCardDetectProvider of(BuildContext context, {bool listen = false}) => Provider.of<KeicyCardDetectProvider>(context, listen: listen);

  String _typeString = "unknown";
  String get typeString => _typeString;

  CreditCardType _cardType;
  CreditCardType get cardType => _cardType;

  String _number = "";
  String get number => number;

  void detectCardType(String number) {
    _number = number.replaceAll(" ", "");
    CreditCardType cardType = detectCCType(_number);
    if (_cardType != cardType) {
      _cardType = cardType;
      _typeString = cardType.toString().split('.')[1];
      notifyListeners();
    }
  }
}
