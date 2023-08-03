import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../BLOC/filter_bloc.dart';

class ProductTypeCard extends StatelessWidget {
  final String titleProductType;

  const ProductTypeCard({
    Key? key,
    required this.titleProductType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        bool isSelected = state.selectedCategory.contains(titleProductType);

        void _makeAChoice(bool isSelected) {
          if (isSelected) {
            context.read<FilterBloc>().add(AddCategoryEvent(titleProductType));
          } else {
            context.read<FilterBloc>().add(RemoveCategoryEvent(titleProductType));
          }
        }

        return Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: GestureDetector(
            onTap: () {
              _makeAChoice(!isSelected);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFFFB01D) : const Color(0xFFFFFFFF),
                  border: Border.all(
                    color: isSelected ? const Color(0xFFFFB01D) : const Color(0xFFDCDCE4),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  titleProductType,
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
      },
    );
  }
}
