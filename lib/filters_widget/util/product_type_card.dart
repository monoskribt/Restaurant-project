import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sushi_shop_project/filters_widget/tools/category_filter.dart';
import '../../bloc/filter_bloc.dart';
import '../../bloc/filter_state.dart';

class ProductTypeBody extends StatefulWidget {
  const ProductTypeBody({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductTypeBody> createState() => _ProductTypeBodyState();
}

class _ProductTypeBodyState extends State<ProductTypeBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FiltersCategoryState>(
      builder: (context, state) {
        if (state is FilterLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FilterLoaded) {
          return SizedBox(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.filter.categoryFilters.length,
              itemBuilder: (context, index) {
                final categoryFilter = state.filter.categoryFilters[index];
                bool isSelected = categoryFilter.value;

                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      context.read<FilterBloc>().add(
                        CategoryFilterUpdated(categoryFilter: categoryFilter.copyWith(value: !categoryFilter.value)),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFFFB01D) : Colors.white,
                          border: Border.all(
                            color: isSelected ? const Color(0xFFFFB01D) : const Color(0xFFDCDCE4),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          categoryFilter.category.titleProduct,
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
            ),
          );
        } else {
          return const Text("Error");
        }
      },
    );
  }
}
