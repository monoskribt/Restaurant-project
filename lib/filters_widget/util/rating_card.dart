import 'package:flutter/material.dart';

class RatingCard extends StatefulWidget {

  final String imageFiltersStarRating;
  final int ratingFilters;

  RatingCard({
    Key? key,
    required this.imageFiltersStarRating,
    required this.ratingFilters
  }) : super(key: key);

  @override
  State<RatingCard> createState() => _RatingCardState();
}

class _RatingCardState extends State<RatingCard> {

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
            height: 44,
            width: 67,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFFFB01D) : const Color(0xFFFFFFFF),
              border: Border.all(
                color: isSelected ? const Color(0xFFFFB01D) : const Color(0xFFDCDCE4),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(widget.imageFiltersStarRating,
                  color: isSelected ? Colors.white : const Color(0xFFFFB01D),
                  width: 16,
                  height: 16,
                ),
                Text(widget.ratingFilters.toString(),
                  style: TextStyle(
                    fontFamily: "Mulish-Regular",
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected ? Colors.white : const Color(0xFFA5A5BA),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
