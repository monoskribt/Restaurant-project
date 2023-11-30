import 'package:flutter/material.dart';
import 'package:Foodbox/screens/payment/new_card_bottom_sheet/new_card.dart';

class BottomSheetHelper {
  static void showViewACard(BuildContext context) {
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
            child: NewCard(),
          ),
        );
      },
    );
  }
}
