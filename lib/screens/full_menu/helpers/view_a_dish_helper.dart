import 'package:flutter/material.dart';
import 'package:Foodbox/screens/view_a_dish/view_a_dish.dart';

//При клике на блюдо появляется данный экран
class ViewADishHelper {
  static void showViewADish(
      BuildContext context,
      String imageDishView,
      String nameDishView,
      double priceView,
      String descriptionView,
      ) {
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
            heightFactor: 7 / 8,
            child: ViewADish(
              imageDishView: imageDishView,
              nameDishView: nameDishView,
              priceView: priceView,
              descriptionView: descriptionView
            ),
          ),
        );
      },
    );
  }
}