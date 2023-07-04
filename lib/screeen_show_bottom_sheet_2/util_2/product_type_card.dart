import 'package:flutter/material.dart';

class ProductTypeCard extends StatefulWidget {
  final String titleProductType;
  const ProductTypeCard({
    Key? key,
    required this.titleProductType,
  }) : super(key: key);

  @override
  State<ProductTypeCard> createState() => _ProductTypeCardState();
}

class _ProductTypeCardState extends State<ProductTypeCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
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
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFFFB01D) : const Color(0xFFFFFFFF),
              border: Border.all(
                color: isSelected ? const Color(0xFFFFB01D) : const Color(0xFFDCDCE4),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              widget.titleProductType,
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

