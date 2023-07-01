import 'package:flutter/material.dart';

class SortingScrollDishes extends StatefulWidget {
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const SortingScrollDishes({
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  _SortingScrollDishesState createState() => _SortingScrollDishesState();
}

class _SortingScrollDishesState extends State<SortingScrollDishes> {
  final List<List<String>> sortingCard = [
    ["All Dishes"],
    ["Most Popular"],
    ["Salad"],
    ["Pasta"],
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        itemCount: sortingCard.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = sortingCard[index][0];
          final isSelected = category == widget.selectedCategory;

          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                onTap: () {
                  widget.onCategorySelected(category);
                },
                child: Container(
                  height: 45,
                  width: 104,
                  color: isSelected ? const Color(0xFFFFB01D) : Colors.grey[300],
                  child: Center(
                    child: Text(
                      category,
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
        },
      ),
    );
  }
}


