import 'package:flutter/material.dart';

class SnackBarBasket {
  static void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      content: const Text(
        "Add dishes to cart", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: "Mulish-Regular",
          color: Color(0xFF666687),
        ),
      ),
      backgroundColor: Colors.grey[300],
      duration: const Duration(seconds: 3),
      shape: const StadiumBorder(),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}