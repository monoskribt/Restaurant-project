import 'package:flutter/material.dart';
import 'package:sushi_shop_project/util/product_day_card.dart';

class DishPageBody extends StatefulWidget {
  const DishPageBody({Key? key}) : super(key: key);

  @override
  State<DishPageBody> createState() => _DishPageBodyState();
}

class _DishPageBodyState extends State<DishPageBody> {
  final List productCard = [
    ["Avocado Chicken", "Salad", 10.40, "assets/images/dish_of_day_1.png"],
    ["Avocado Chicken", "Salad", 10.40, "assets/images/dish_of_day_1.png"],
    ["Avocado Chicken", "Salad", 10.40, "assets/images/dish_of_day_1.png"],
  ];

  PageController pageController = PageController(viewportFraction: 0.85);
  double currentPageValue = 0.0;
  double scaleFactor = 0.4;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: SizedBox(
        height: 145,
        width: 380,
        child: PageView.custom(
          controller: pageController,
          physics: const BouncingScrollPhysics(),
          childrenDelegate: SliverChildBuilderDelegate(
                (context, index) {
              final item = productCard[index];
              return _buildPageItem(item, index);
            },
            childCount: productCard.length,
          ),
        ),
      ),
    );
  }

  Widget _buildPageItem(List<dynamic> item, int index) {
    final nameDish = item[0];
    final typeOfDishes = item[1];
    final price = item[2];
    final imageDishOfDay = item[3];

    double scaleFactor = 1.0;
    if (index == currentPageValue.floor()) {
      scaleFactor = 1 - (currentPageValue - index).abs() * (1 - this.scaleFactor);
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Transform.scale(
        scale: scaleFactor,
        child: ProductDayCard(
          nameDish: nameDish,
          typeOfDishes: typeOfDishes,
          price: price,
          imageDishOfDay: imageDishOfDay,
        ),
      ),
    );
  }
}
