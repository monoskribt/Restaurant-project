import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sushi_shop_project/data/parsing_for_search_dish/dish_data_for_search.dart';
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

  void updateList(String value) {
    if (value.isEmpty) {
      setState(() {
        isSearchOpen = false;
        displayList.clear();
      });
    } else {
      setState(() {
        isSearchOpen = true;
        displayList = DishDataForSearch.mainDishList
            .where((element) =>
            element.dishTitle!.toLowerCase().contains(value.toLowerCase()))
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.grey[200]!),
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
              ],
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
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
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
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Row(
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
