import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ViewADish extends StatelessWidget {
  final String imageDishView;
  final String nameDishView;
  final double priceView;
  final String descriptionView;
  final double ratingView;

  const ViewADish({
    Key? key,
    required this.imageDishView,
    required this.nameDishView,
    required this.priceView,
    required this.descriptionView,
    required this.ratingView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Center(
                  child: Image.asset(
                    imageDishView,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 260.0,
                    child: Text(
                      nameDishView,
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF32324D),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 7.0, right: 3.0),
                    child: Text(
                      "\$",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFFB080),
                      ),
                    ),
                  ),
                  Text(
                    priceView.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFFF7B2C),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: Text(
                  descriptionView,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8E8EA9),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void showViewADish(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return ViewADish(
          imageDishView: imageDishView,
          nameDishView: nameDishView,
          priceView: priceView,
          descriptionView: descriptionView,
          ratingView: ratingView,
        );
      },
    );
  }
}
