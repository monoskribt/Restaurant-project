import 'package:flutter/material.dart';
import 'package:sushi_shop_project/screens/order/order_components/add_contact_details.dart';

class BottomSheetHelper {
  static void showViewAContact(BuildContext context) {
    showModalBottomSheet<void>(
      enableDrag: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(25),
          ),
          child: FractionallySizedBox(
            heightFactor: 1 / 2,
            child: AddContactDetails(),
          ),
        );
      },
    );
  }
}