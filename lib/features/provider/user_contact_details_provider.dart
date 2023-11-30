import 'package:flutter/material.dart';
import 'package:Foodbox/models/user_contact_details.dart';

class UserContactDetailsProvider with ChangeNotifier {
  final UserContactDetails _userContactDetails = UserContactDetails();
  UserContactDetails get userContactDetails => _userContactDetails;

  final List<UserContactDetails> _userContactDetailsList = [];
  List<UserContactDetails> get userContactDetailsList =>
      _userContactDetailsList;

  bool get isContactInfoFinish =>
      _userContactDetails.name.isNotEmpty &&
      _userContactDetails.number.isNotEmpty &&
      _userContactDetails.address.isNotEmpty;

  void updateUserContactName(String value) {
    _userContactDetails.name = value;
    notifyListeners();
  }

  void updateUserContactNumber(String value) {
    _userContactDetails.number = value;
    notifyListeners();
  }

  void updateUserContactAddress(String value) {
    _userContactDetails.address = value;
    notifyListeners();
  }

  void addContact(UserContactDetails userContactDetails) {
    _userContactDetailsList.add(userContactDetails);
    notifyListeners();
  }

  void clear() {
    _userContactDetails.name = '';
    _userContactDetails.number = '';
    _userContactDetails.address = '';
    _userContactDetailsList.clear();
    notifyListeners();
  }

}
