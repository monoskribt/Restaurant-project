import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackBarAddToOrder {
  static void showSnackBar(BuildContext context, String dishName, int quantity, bool isTrue) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      content: SizedBox(
        height: isTrue ? 0.085 * screenHeight : 0.07 * screenHeight,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: isTrue ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 0.65 * screenWidth,
                  child: Text(
                    dishName,
                    textAlign: isTrue ? TextAlign.start : TextAlign.center,
                    style: TextStyle(
                      fontSize: 0.018 * screenHeight,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Mulish-Regular",
                      color: const Color(0xFF666687),
                    ),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      isTrue ? Icons.check_circle : Icons.close,
                      color: isTrue ? Colors.green : Colors.red,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 0.005 * screenHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/order_menu');
                  },
                  child: Text("Go to Order",
                      style: TextStyle(
                        fontSize: 0.02 * screenHeight,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Mulish-Regular",
                        color: const Color(0xFFFF7B2C),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
      duration: const Duration(seconds: 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
