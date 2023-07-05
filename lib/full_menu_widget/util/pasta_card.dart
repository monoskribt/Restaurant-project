import 'package:flutter/material.dart';
import 'package:sushi_shop_project/view_a_dish_widget/view_a_dish.dart';


class PastaCard extends StatelessWidget {
  final String nameDish;
  final double price;
  final double rating;
  final String imagePastaCard;
  final String description;

  const PastaCard({
    Key? key,
    required this.nameDish,
    required this.price,
    required this.rating,
    required this.imagePastaCard,
    required this.description,
}) : super(key : key);

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
              imageDishView: imagePastaCard,
              nameDishView: nameDish,
              priceView: price,
              descriptionView: description,
              ratingView: rating,
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
      child: Padding(
        padding: const EdgeInsets.only(top: 16, right: 20, bottom: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: 142,
            color: Colors.white,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 110,
                      width: 110,
                      child: Center(
                        child: Image.asset(
                          imagePastaCard,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      nameDish,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Mulish",
                        color: Color(0xFF32324D),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 3.0),
                          child: Text(
                            "\$",
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFFB080),
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          price.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Mulish",
                            color: Color(0xFFFF7B2C),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: 14,
                  right: 10,
                  child: Container(
                    width: 42.14,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.1),
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          child: Image.asset("assets/images/star.png",
                            color: const Color(0xFFFFB01D),
                          ),
                        ),
                        Text(
                          rating.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF8E8EA9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
