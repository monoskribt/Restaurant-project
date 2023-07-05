import 'package:flutter/material.dart';
import 'package:sushi_shop_project/view_a_dish_widget/view_a_dish.dart';

class ProductDayCard extends StatelessWidget {
  final String nameDishOfDay;
  final String typeDishOfDay;
  final String imageDishOfDay;
  final double priceDishOfDay;
  final double ratingDishOfDay;
  final String descriptionDishOfDay;

  const ProductDayCard({
    Key? key,
    required this.nameDishOfDay,
    required this.typeDishOfDay,
    required this.priceDishOfDay,
    required this.imageDishOfDay,
    required this.ratingDishOfDay,
    required this.descriptionDishOfDay,
  }) : super(key: key);

  void showViewADish(BuildContext context) {
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
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(25),
          ),
          child: FractionallySizedBox(
            heightFactor: 7/8,
            child: ViewADish(
              imageDishView: imageDishOfDay,
              nameDishView: nameDishOfDay,
              priceView: priceDishOfDay,
              descriptionView: descriptionDishOfDay,
              ratingView: ratingDishOfDay,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: () {
        showViewADish(context);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          color: const Color(0xFF212134),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "Product of the day",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFA5A5BA),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Mulish-Regular",
                        ),
                      ),
                    ),
                    Text(
                      nameDishOfDay,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Mulish-Regular",
                      ),
                    ),
                    Text(
                      typeDishOfDay,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Mulish-Regular",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              '\$',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFF7B2C),
                                fontFamily: "Mulish-Regular",                            ),
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            priceDishOfDay.toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFFFF7B2C),
                              fontFamily: "Mulish-Regular",                          ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: 141,
                    height: 145,
                    child: Image.asset(
                      imageDishOfDay,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
