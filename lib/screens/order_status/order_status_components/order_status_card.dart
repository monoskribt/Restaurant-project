import 'package:flutter/material.dart';

class OrderStatusCard extends StatelessWidget {
  final String imageOrderList;
  final String titleOrderList;
  final int quantity;
  final double priceOrderList;
  final String request;

  const OrderStatusCard({
    Key? key,
    required this.imageOrderList,
    required this.titleOrderList,
    required this.quantity,
    required this.priceOrderList,
    required this.request,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildProductInfo(context),
                SizedBox(width: 0.025 * screenWidth),
                _buildPriceInfo(),
              ],
            ),
          ),
        );
  }

  Widget _buildPriceInfo() {
    const TextStyle priceTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Color(0xFF4A4A6A),
      fontFamily: "Mulish-Regular",
    );
    const TextStyle currencyTextStyle = TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.w700,
      fontFamily: "Mulish-Regular",
      color: Color(0xFF8E8EA9),
    );
    const TextStyle quantityTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Color(0xFFA5A5BA),
      fontFamily: "Mulish-Regular",
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "${quantity.toInt()} x ",
          style: quantityTextStyle,
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 6.0, right: 2.0),
          child: Text(
            "\$",
            style: currencyTextStyle,
          ),
        ),
        Text(
          priceOrderList.toStringAsFixed(2),
          style: priceTextStyle,
        ),
      ],
    );
  }

  Widget _buildProductInfo(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
                imageOrderList,
               width: 0.15 * screenWidth,
              height: 0.15 * screenHeight / 2,
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 0.4 * screenWidth,
              child: Text(
                titleOrderList,
                style: TextStyle(
                  fontSize: 0.018 * screenHeight,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF32324D),
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
    );
  }
}
