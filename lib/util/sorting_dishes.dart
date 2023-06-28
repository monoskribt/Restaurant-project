import 'package:flutter/material.dart';

class SortingDishes extends StatelessWidget {
  final String nameSorting;
  final bool isSelected;
  final VoidCallback onTap;

  const SortingDishes({
    required this.nameSorting,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 45,
            width: 104,
            color: isSelected ? const Color(0xFFFFB01D) : Colors.grey[300],
            child: Center(
              child: Text(
                nameSorting,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : const Color(0xFF8E8EA9),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
