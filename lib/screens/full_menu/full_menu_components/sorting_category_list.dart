import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sushi_shop_project/features/cubit/cubit_for_sorting_card_full_menu/sorting_dishes_cubit.dart';

class SortingCategoryList extends StatelessWidget {
  const SortingCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: BlocBuilder<SortingDishesCubit, SortingDishesState>(
        builder: (context, selectedCategory) {
          return ListView.separated(
            itemCount: SortingDishesState.values.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 8.0),
            itemBuilder: (context, index) {
              final category = SortingDishesState.values[index];
              final isSelected = category == selectedCategory;
              String categoryName = _getCategoryName(category);

              return _buildCategoryButton(
                categoryName: categoryName,
                isSelected: isSelected,
                onTap: () {
                  _onCategorySelected(context, category);
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildCategoryButton({
    required String categoryName,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
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
  }

  String _getCategoryName(SortingDishesState category) {
    switch(category) {
      case SortingDishesState.allDishes:
        return "All Dishes";
      case SortingDishesState.mostPopular:
        return "Most Popular";
      case SortingDishesState.salad:
        return "Salad";
      case SortingDishesState.pasta:
        return "Pasta";
      default:
        return "";
    }
  }

  void _onCategorySelected(BuildContext context, SortingDishesState category) {
    final cubit = context.read<SortingDishesCubit>();
    cubit.selectCategory(category);
  }
}
