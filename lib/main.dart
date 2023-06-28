import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sushi_shop_project/home/most_popular_body_function.dart';
import 'package:sushi_shop_project/home/pasta_card_body_function.dart';
import 'package:sushi_shop_project/home/sorting_scroll_dishes_function.dart';
import 'package:sushi_shop_project/home/dish_page_body_function.dart';

import 'home/salad_card_body_function.dart';



void main() => runApp(const FullMenu());

class FullMenu extends StatefulWidget {
  const FullMenu({Key? key}) : super(key: key);

  @override
  State<FullMenu> createState() => _FullMenuState();
}

class _FullMenuState extends State<FullMenu> {
  String selectedCategory = "All Dishes";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 24, left: 25, right: 25, bottom: 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset(
                          "assets/images/navigator.svg",
                          height: 20,
                          width: 20,
                          color: Colors.grey[400],
                        ),
                      ),
                      const Text(
                        "Gram Bistro",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/images/menu.svg",
                          height: 24,
                          width: 24,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 17),
                  const Text(
                    "Choose the best dish for you",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey[200]!),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: SvgPicture.asset(
                              "assets/images/search.svg",
                              height: 20,
                              width: 20,
                              color: Colors.grey[600],
                            ),
                          ),
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                "assets/images/filter.svg",
                                height: 25,
                                width: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const DishPageBody(),
                  const SizedBox(height: 20),
                  if (selectedCategory == "All Dishes") ...[
                    SortingScrollDishes(
                      selectedCategory: selectedCategory,
                      onCategorySelected: (category) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Text(
                          "Most Popular",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF666687),
                          ),
                        ),
                      ],
                    ),
                    MostPopularBody(),
                    const Row(
                      children: [
                        Text(
                          "Salad",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF666687),
                          ),
                        ),
                      ],
                    ),
                    SaladCardBody(),
                    const Row(
                      children: [
                        Text(
                          "Pasta",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF666687),
                          ),
                        ),
                      ],
                    ),
                    PastaCardBody(),
                  ] else if (selectedCategory == "Most Popular") ...[
                    SortingScrollDishes(
                      selectedCategory: selectedCategory,
                      onCategorySelected: (category) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Text(
                          "Most Popular",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF666687),
                          ),
                        ),
                      ],
                    ),
                    MostPopularBody(),
                  ] else if (selectedCategory == "Salad") ...[
                    SortingScrollDishes(
                      selectedCategory: selectedCategory,
                      onCategorySelected: (category) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Text(
                          "Salad",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF666687),
                          ),
                        ),
                      ],
                    ),
                    SaladCardBody(),
                  ] else if(selectedCategory == "Pasta") ...[
                    SortingScrollDishes(
                      selectedCategory: selectedCategory,
                      onCategorySelected: (category) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Text(
                          "Pasta",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF666687),
                          ),
                        ),
                      ],
                    ),
                    PastaCardBody(),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}





