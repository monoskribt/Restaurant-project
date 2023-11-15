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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        ViewADishHelper.showViewADish(context, imageDishOfDay, nameDishOfDay,
            priceDishOfDay, descriptionDishOfDay);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.02 * screenWidth),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            color: const Color(0xFF212134),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 0.030 * screenHeight, left: 0.045 * screenWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 0.015 * screenHeight),
                        child: Text(
                          "Product of the day",
                          style: TextStyle(
                            fontSize: 0.016 * screenHeight,
                            color: const Color(0xFFA5A5BA),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Mulish-Regular",
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 0.45 * screenWidth,
                                child: Text(
                                  nameDishOfDay,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 0.018 * screenHeight,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Mulish-Regular",
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 0.02 * screenWidth),
                      Padding(
                        padding: EdgeInsets.only(top: 0.015 * screenHeight),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: 0.01 * screenHeight),
                              child: Text(
                                '\$',
                                style: TextStyle(
                                  fontSize: 0.014 * screenHeight,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFFFF7B2C),
                                  fontFamily: "Mulish-Regular",
                                ),
                              ),
                            ),
                            SizedBox(width: 0.01 * screenWidth),
                            Text(
                              priceDishOfDay.toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 0.021 * screenHeight,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFFFF7B2C),
                                fontFamily: "Mulish-Regular",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  imageDishOfDay,
                  height: 0.32 * screenHeight,
                  width: 0.32 * screenWidth,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
