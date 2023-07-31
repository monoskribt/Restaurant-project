import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit_for_sorting_card_full_menu/sorting_dishes_cubit.dart';

class SortingScrollDishes extends StatefulWidget {
  const SortingScrollDishes({Key? key}) : super(key: key);

  @override
  _SortingScrollDishesState createState() => _SortingScrollDishesState();
}

class _SortingScrollDishesState extends State<SortingScrollDishes> {
  final List<SortingDishesState> sortingCard = [
    SortingDishesState.allDishes,
    SortingDishesState.mostPopular,
    SortingDishesState.salad,
    SortingDishesState.pasta,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: BlocBuilder<SortingDishesCubit, SortingDishesState>(
        builder: (context, selectedCategory) {
          return ListView.separated(
            itemCount: sortingCard.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 8.0),
            itemBuilder: (context, index) {
              final category = sortingCard[index];
              final isSelected = category == selectedCategory;

              String categoryName = "";
              switch (category) {
                case SortingDishesState.allDishes:
                  categoryName = "All Dishes";
                  break;
                case SortingDishesState.mostPopular:
                  categoryName = "Most Popular";
                  break;
                case SortingDishesState.salad:
                  categoryName = "Salad";
                  break;
                case SortingDishesState.pasta:
                  categoryName = "Pasta";
                  break;
              }

              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  onTap: () {
                    _onCategorySelected(context, category);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    decoration: isSelected
                        ? const BoxDecoration(
                      color: Color(0xFFFFB01D),
                    )
                        : const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFFCFCFC),
                          Color(0xFFF7F7F7),
                          Color(0xFFF7F7F7),
                          Color(0xFFF7F7F7),
                          Color(0xFFFCFCFC),
                        ],
                        stops: [0, 0.1004, 0.5156, 0.8958, 1],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        categoryName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                          fontFamily: "Mulish-Regular",
                          color: isSelected ? Colors.white : const Color(0xFF8E8EA9),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _onCategorySelected(BuildContext context, SortingDishesState category) {
    final cubit = context.read<SortingDishesCubit>();
    cubit.selectCategory(category);
  }
}