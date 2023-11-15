import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sushi_shop_project/data_parsing/parsing/parsing_for_search_dish/dish_data_for_search_parse.dart';
import 'package:sushi_shop_project/models/dish_model_for_search.dart';
import 'package:sushi_shop_project/screens/full_menu/helpers/view_a_dish_helper.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _searchController = TextEditingController();
  bool isSearchOpen = false;
  List<DishSearchModel> displayList = [];

  String? selectedCategory;

  void updateList(String value) {
    setState(() {
      isSearchOpen = true;
      displayList = DishDataForSearchParse.mainDishList
          .where((element) =>
          element.dishTitle!
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    });
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.008 * screenWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 0.075 * screenHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.grey[200]!),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.030 * screenWidth),
                  child: SvgPicture.asset(
                    "assets/images/search.svg",
                    fit: BoxFit.cover,
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
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: const Color(0xFF8E8EA9),
                        fontFamily: "Mulish-Regular",
                        fontSize: 0.022 * screenHeight,
                      ),
                    ),
                  ),
                ),
                // Filters Screen
                // IconButton(
                //   onPressed: () {
                //     FilterScreenHelper.showFilterScreen(context);
                //   },
                //   icon: SvgPicture.asset(
                //     "assets/images/filter.svg",
                //     height: 25,
                //     width: 25,
                //   ),
                // ),
                if (isSearchOpen)
                  IconButton(
                    onPressed: _closeSearch,
                    icon: const Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                  ),
              ],
            ),
          ),
          if (isSearchOpen) ...[
            SizedBox(height: 0.005 * screenHeight),
            GestureDetector(
              onTap: _closeSearch,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: displayList.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      _closeSearch();
                      if (index >= 0 && index < displayList.length) {
                        ViewADishHelper.showViewADish(
                          context,
                          displayList[index].dishImage!,
                          displayList[index].dishTitle!,
                          displayList[index].dishPrice!,
                          displayList[index].description!,
                        );
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Container(
                        padding: EdgeInsets.all(0.01 * screenHeight),
                        margin: EdgeInsets.symmetric(vertical: 0.02 * screenWidth),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              displayList[index].dishImage!,
                              width: 70,
                              height: 70,
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                displayList[index].dishTitle!,
                                style: TextStyle(
                                  fontSize: 0.018 * screenHeight,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Mulish-Regular",
                                  color: const Color(0xFF666687),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 0.1 * screenWidth
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 0.01 * screenHeight
                                    ),
                                    child: Text(
                                      "\$",
                                      style: TextStyle(
                                        fontSize: 0.014 * screenHeight,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Mulish-Regular",
                                        color: const Color(0xFFFFB080),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 0.005 * screenWidth),
                                  Text(
                                    displayList[index].dishPrice!.toStringAsFixed(2),
                                    style: TextStyle(
                                      fontSize: 0.021 * screenHeight,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Mulish-Regular",
                                      color: const Color(0xFFFF7B2C),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
