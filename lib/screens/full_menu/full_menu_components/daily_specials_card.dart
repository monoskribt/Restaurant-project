import 'package:flutter/material.dart';
import 'package:sushi_shop_project/screens/full_menu/helpers/view_a_dish_helper.dart';

class DailySpecialsCard extends StatelessWidget {
  final String nameDishOfDay;
  final String imageDishOfDay;
  final double priceDishOfDay;
  final String descriptionDishOfDay;

  const DailySpecialsCard({
    Key? key,
    required this.nameDishOfDay,
    required this.priceDishOfDay,
    required this.imageDishOfDay,
    required this.descriptionDishOfDay,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: () {
        ViewADishHelper.showViewADish(
            context,
            imageDishOfDay,
            nameDishOfDay,
            priceDishOfDay,
            descriptionDishOfDay
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                      SizedBox(
                        width: 150,
                        child: Text(
                          nameDishOfDay,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Mulish-Regular",
                          ),
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
      ),
    );
  }
}