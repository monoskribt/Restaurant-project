import 'package:flutter/material.dart';

class IngredientsCard extends StatelessWidget {
  final String title;
  final String imageIngredients;

  const IngredientsCard(
      {Key? key, required this.title, required this.imageIngredients})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 100,
          height: 85,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 20,
                  height: 20,
                  child:
                  Image.asset(imageIngredients)),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFf8E8EA9),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
