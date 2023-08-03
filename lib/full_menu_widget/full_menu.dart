import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sushi_shop_project/filters_widget/filters.dart';
import 'package:sushi_shop_project/filters_widget/tools/filters_screen.dart';
import 'package:sushi_shop_project/full_menu_widget/tools/dish_data.dart';
import 'package:sushi_shop_project/full_menu_widget/tools/dish_model_for_search.dart';
import 'package:sushi_shop_project/full_menu_widget/util_2/most_popular_text.dart';
import 'package:sushi_shop_project/full_menu_widget/util_2/pasta_text.dart';
import 'package:sushi_shop_project/full_menu_widget/util_2/pizza_text.dart';
import 'package:sushi_shop_project/full_menu_widget/util_2/salad_text.dart';
import '../cubit/cubit_for_sorting_card_full_menu/sorting_dishes_cubit.dart';
import '../drawer_widget/main_drawer.dart';
import '../view_a_dish_widget/tools/view_a_dish_helper.dart';
import 'function/dish_page_body_function.dart';
import 'function/most_popular_body_function.dart';
import 'function/pasta_card_body_function.dart';
import 'function/salad_card_body_function.dart';
import 'function/sorting_scroll_dishes_body_function.dart';

void main() => runApp(const FullMenu());

class FullMenu extends StatefulWidget {
  const FullMenu({Key? key}) : super(key: key);

  @override
  State<FullMenu> createState() => _FullMenuState();
}

class _FullMenuState extends State<FullMenu> {

  void showFilterScreen(BuildContext context) {
    showModalBottomSheet<void>(
      enableDrag: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
          child: FractionallySizedBox(
            heightFactor: 12 / 13,
            child: Filters(),
          ),
        );
      },
    );
  }


  String selectedCategory = "All Dishes";
  bool isSearchOpen = false;
  List<DishSearchModel> displayList = List.from(DishData.mainDishList);
  final TextEditingController _searchController = TextEditingController();

  void updateList(String value) {
    if (value.isEmpty) {
      setState(() {
        isSearchOpen = false;
      });
    } else {
      setState(() {
        isSearchOpen = true;
        displayList = DishData.mainDishList
            .where((element) => element.dishTitle!
            .toLowerCase()
            .contains(value.toLowerCase()))
            .toList();
      });
    }
  }

  void _closeSearch() {
    setState(() {
      isSearchOpen = false;
      _searchController.clear();
    });
  }

  void _closeKeyboard() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        endDrawer: const MainDrawer(),
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
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 24, left: 25, right: 25, bottom: 0),
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
                            color: const Color(0xFFDCDCE4),
                          ),
                        ),
                        const Text(
                          "Gram Bistro",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF8E8EA9),
                            fontFamily: "Mulish-Regular",
                          ),
                        ),
                        const Spacer(),
                        Builder(builder: (context) {
                          return IconButton(
                            icon: SvgPicture.asset(
                              "assets/images/menu.svg",
                              height: 24,
                              width: 24,
                            ),
                            onPressed: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                          );
                        })
                      ],
                    ),
                    const SizedBox(height: 17),
                    const Text(
                      "Choose the best dish for you",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        fontFamily: "DMSans-Regular",
                        color: Color(0xFF32324D),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                          Border.all(width: 1, color: Colors.grey[200]!),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 12.0),
                              child: SvgPicture.asset(
                                "assets/images/search.svg",
                                height: 20,
                                width: 20,
                                color: const Color(0xFFC0C0CF),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                onSubmitted: (value) {
                                  _closeKeyboard();
                                },
                                onChanged: (value) => updateList(value),
                                controller: _searchController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                    color: Color(0xFF8E8EA9),
                                    fontFamily: "Mulish-Regular",
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            //Экран ФИЛЬРОВ
                      IconButton(
                        onPressed: () {
                          showFilterScreen(context);
                        },
                        icon: SvgPicture.asset(
                          "assets/images/filter.svg",
                          height: 25,
                          width: 25,
                        ),
                      ),
                          ],
                        ),
                      ),
                    ),

                    if (isSearchOpen) ...[
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: _closeSearch,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                            itemCount: displayList.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                _closeSearch();
                                ViewADishHelper.showViewADish(
                                    context,
                                    displayList[index].dishImage!,
                                    displayList[index].dishTitle!,
                                    displayList[index].dishPrice!,
                                    displayList[index].description!
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 1, color: Colors.grey[200]!),
                                    ),
                                    child: Image.asset(
                                      displayList[index].dishImage!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                      displayList[index].dishTitle!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Mulish-Regular",
                                        color: Color(0xFF666687),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 3.0),
                                        child: Text(
                                          "\$",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFFFFB080),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        displayList[index].dishPrice!.toStringAsFixed(2),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Mulish",
                                          color: Color(0xFFFF7B2C),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],

                    const SizedBox(height: 20),
                    DishPageBody(),
                    const SizedBox(height: 20),
                    const SortingScrollDishes(),
                    BlocBuilder<SortingDishesCubit, SortingDishesState>(
                      builder: (context, state) {
                        if (state == SortingDishesState.allDishes) {
                          return Column(
                            children: [
                              const SizedBox(height: 15),
                              const MostPopularText(),
                              MostPopularBody(),
                              const SaladText(),
                              SaladCardBody(),
                              const PastaText(),
                              PastaCardBody(),
                            ],
                          );
                        } else if (state == SortingDishesState.mostPopular) {
                          return Column(
                            children: [
                              const SizedBox(height: 15),
                              const MostPopularText(),
                              MostPopularBody(),
                            ],
                          );
                        } else if (state == SortingDishesState.salad) {
                          return Column(
                            children: [
                              const SizedBox(height: 15),
                              const SaladText(),
                              SaladCardBody(),
                            ],
                          );
                        } else if (state == SortingDishesState.pasta) {
                          return Column(
                            children: [
                              const SizedBox(height: 15),
                              const PastaText(),
                              PastaCardBody(),
                            ],
                          );
                        }
                        return Container();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}