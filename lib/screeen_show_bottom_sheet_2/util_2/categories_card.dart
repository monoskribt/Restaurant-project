import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesCard extends StatefulWidget {
  final String titleCategories;

  CategoriesCard({
    Key? key,
    required this.titleCategories,
  }) : super(key: key);

  @override
  _CategoriesCardState createState() => _CategoriesCardState();
}

class _CategoriesCardState extends State<CategoriesCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            height: 44,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFFFB01D) : const Color(0xFFFFFFFF),
              border: Border.all(
                color: isSelected ? const Color(0xFFFFB01D) : const Color(0xFFDCDCE4),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              widget.titleCategories,
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Mulish-Regular",
                color: isSelected ? Colors.white : const Color(0xFFA5A5BA),
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


