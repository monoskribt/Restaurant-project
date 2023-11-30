import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Foodbox/features/bloc/filter_bloc.dart';
import 'package:Foodbox/features/bloc/filter_state.dart';
import 'package:Foodbox/screens/filters/tools/product_type_filter.dart';


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
        if(state is FilterLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is FilterLoaded) {
          return buildProductTypeFilterOptions(state);
        }
        else {
          return const Text("Error");
        }
      },
    );
  }

  Widget buildProductTypeFilterOptions(FilterLoaded state) {
    return Wrap(
      spacing: 14.0,
      runSpacing: 14.0,
      children: state.filter.productTypeFilters.map((productTypeFilter) {
        bool isSelected = productTypeFilter.value;

        return buildProductTypeFilter(productTypeFilter, isSelected);
      }).toList(),
    );
  }

  Widget buildProductTypeFilter(
      ProductTypeFilter productTypeFilter, bool isSelected) {
    return GestureDetector(
      onTap: () {
        context.read<FilterBloc>().add(
              ProductTypeFilterUpdated(
                  productTypeFilter: productTypeFilter.copyWith(
                      value: !productTypeFilter.value)),
            );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFFFB01D) : Colors.white,
            border: Border.all(
              color: isSelected
                  ? const Color(0xFFFFB01D)
                  : const Color(0xFFDCDCE4),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            productTypeFilter.productType.titleProduct,
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
