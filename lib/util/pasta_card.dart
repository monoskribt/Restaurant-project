import 'package:flutter/material.dart';

class PastaCard extends StatelessWidget {
  final String nameDish;
  final double price;
  final double rating;
  final String imageMostPopular;

  const PastaCard({
    Key? key,
    required this.nameDish,
    required this.price,
    required this.rating,
    required this.imageMostPopular,
}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, top: 16, right: 12, bottom: 16),
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
                        imageMostPopular,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    nameDish,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
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
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
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
                          child:
                          Image.asset("assets/images/star.png")
                      ),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF32324D),
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
    );
  }
}
