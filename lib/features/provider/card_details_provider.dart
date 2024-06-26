import 'package:flutter/cupertino.dart';
import 'package:Foodbox/models/card_details_model.dart';

class CardDetailsProvider with ChangeNotifier {
  final CardDetails _cardDetails = CardDetails();
  CardDetails get cardDetails => _cardDetails;

  final List<CardDetails> _cardList = [];
  List<CardDetails> get cardList => _cardList;

  bool get isCardInfoFinish =>
      _cardDetails.cardNumber.isNotEmpty &&
          _cardDetails.cardholderName.isNotEmpty &&
          _cardDetails.expireDate.isNotEmpty &&
          _cardDetails.cvv.isNotEmpty;

  bool _showCardBanking = false;
  bool get showCardBanking => _showCardBanking;

  void setShowCardBanking(bool value) {
    _showCardBanking = value;
    notifyListeners();
  }

  void updateCardNumber(String value) {
    _cardDetails.cardNumber = value;
    notifyListeners();
  }

  void updateCardholderName(String value) {
    _cardDetails.cardholderName = value;
    notifyListeners();
  }

  void updateExpireDate(String value) {
    _cardDetails.expireDate = value;
    notifyListeners();
  }

  void updateCVV(String value) {
    _cardDetails.cvv = value;
    notifyListeners();
  }
  void addCard(CardDetails card) {
    _cardList.add(card);
    notifyListeners();
  }
}
