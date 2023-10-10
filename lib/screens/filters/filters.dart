import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sushi_shop_project/features/bloc/filter_bloc.dart';
import 'package:sushi_shop_project/features/bloc/filter_state.dart';
import 'package:sushi_shop_project/screens/filters/components/categories_body.dart';
import 'package:sushi_shop_project/screens/filters/components/product_type_body.dart';
import 'package:sushi_shop_project/screens/filters/filters_function/price_range_slider.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: const BoxDecoration(
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
      child: Column(
        children: [
          buildTitle("Filters"),
          const SizedBox(height: 24.0),
          buildSectionTitle("Select Categories"),
          const SizedBox(height: 10),
          buildCategoriesBody(),
          const SizedBox(height: 24),
          buildSectionTitle("Select Product Type"),
          const SizedBox(height: 10),
          buildProductTypeBody(),
          const SizedBox(height: 24),
          buildSectionTitle("Price Range"),
          const SizedBox(height: 10),
          const RangeSliderFunction(),
          const SizedBox(height: 30),
          buildApplyFiltersButton(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildApplyFiltersButton() {
    return BlocBuilder<FilterBloc, FiltersCategoryState>(
      builder: (context, state) {
        if (state is FilterLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FilterLoaded) {
          return Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _applyFilters(state);
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          backgroundColor: const Color(0xFF615793),
                          minimumSize: const Size(double.infinity, 60),
                        ),
                        child: const Text(
                          "Apply filters",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "Mulish-Regular",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Text("Error");
        }
      },
    );
  }

  Widget buildProductTypeBody() {
    return const Padding(
      padding: EdgeInsets.only(left: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ProductTypeBody(),
          ),
        ],
      ),
    );
  }

  Widget buildCategoriesBody() {
    return const Padding(
      padding: EdgeInsets.only(left: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CategoriesBody(),
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
              fontFamily: "Mulish-Regular",
              color: Color(0xFF666687),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: "Mulish-Regular",
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color(0xFF32324D),
            ),
          )
        ],
      ),
    );
  }

  void _applyFilters(FilterLoaded state) {
    var productType = state.filter.productTypeFilters
        .where((filter) => filter.value)
        .map((filter) => filter.productType.titleProduct)
        .toList();
    var categories = state.filter.categoryFilters
        .where((filter) => filter.value)
        .map((filter) => filter.category.titleCategories)
        .toList();
    print(productType);
    print(categories);
  }
}
