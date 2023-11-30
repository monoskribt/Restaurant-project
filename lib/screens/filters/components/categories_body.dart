import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Foodbox/features/bloc/filter_bloc.dart';
import 'package:Foodbox/features/bloc/filter_state.dart';
import 'package:Foodbox/screens/filters/tools/category_filter.dart';

class CategoriesBody extends StatefulWidget {
  const CategoriesBody({Key? key}) : super(key: key);

  @override
  _CategoriesBodyState createState() => _CategoriesBodyState();
}

class _CategoriesBodyState extends State<CategoriesBody> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FiltersCategoryState>(
      builder: (context, state) {
        if(state is FilterLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is FilterLoaded) {
          return buildCategoryFilterOptions(state);
        }
        else {
          return const Text("Error");
        }
      },
    );
  }


  Widget buildCategoryFilterOptions(FilterLoaded state) {
    return Wrap(
      spacing: 14.0,
      runSpacing: 14.0,
      children: state.filter.categoryFilters.map((categoryFilter) {
        bool isSelected = categoryFilter.value;
        return buildCategoryFilter(categoryFilter, isSelected);
      }).toList(),
    );
  }

  Widget buildCategoryFilter(CategoryFilter categoryFilter, bool isSelected) {
    return GestureDetector(
      onTap: () {
        context.read<FilterBloc>().add(
              CategoryFilterUpdated(
                  categoryFilter:
                      categoryFilter.copyWith(value: !categoryFilter.value)),
            );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          decoration: BoxDecoration(
            color:
                isSelected ? const Color(0xFFFFB01D) : const Color(0xFFFFFFFF),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFFFFB01D)
                  : const Color(0xFFDCDCE4),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            categoryFilter.category.titleCategories,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Mulish-Regular",
              color: isSelected ? Colors.white : const Color(0xFFA5A5BA),
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
