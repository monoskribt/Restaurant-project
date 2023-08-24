import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sushi_shop_project/bloc/filter_state.dart';
import 'package:sushi_shop_project/filters_widget/function/price_range_slider_function.dart';
import 'package:sushi_shop_project/filters_widget/util/product_type_card.dart';
import '../bloc/filter_bloc.dart';
import 'function/categories_function.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            const Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Filters",
                    style: TextStyle(
                      fontFamily: "Mulish-Regular",
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF32324D),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Text(
                    "Select Categories",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      fontFamily: "Mulish-Regular",
                      color: Color(0xFF666687),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CategoriesBody(),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Text(
                    "Select Product Type",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      fontFamily: "Mulish-Regular",
                      color: Color(0xFF666687),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: ProductTypeBody(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Text(
                    "Price Range",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      fontFamily: "Mulish-Regular",
                      color: Color(0xFF666687),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const RangeSliderBody(),
            const SizedBox(height: 30),
            BlocBuilder<FilterBloc, FiltersCategoryState>(
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
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
