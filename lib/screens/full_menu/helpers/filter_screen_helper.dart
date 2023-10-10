import 'package:flutter/material.dart';
import 'package:sushi_shop_project/screens/filters/filters.dart';

//При клике на иконку фильтров появляется данный экран
class FilterScreenHelper {
  static void showFilterScreen(BuildContext context) {
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
        return const ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
          child: FractionallySizedBox(
            heightFactor: 12 / 13,
            child: Filters(),
          ),
        );
      },
    );
  }
}