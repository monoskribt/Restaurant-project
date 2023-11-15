import 'package:flutter/material.dart';

class SnackBarContact {
  static void showSnackBar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      content: Text(
        errorMessage, textAlign: TextAlign.center,
        style: const TextStyle(
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