import 'package:flutter/material.dart';

class SortingDishes extends StatelessWidget {
  final String nameSorting;
  final bool isSelected;
  final VoidCallback onTap;

  const SortingDishes({Key? key,
    required this.nameSorting,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
