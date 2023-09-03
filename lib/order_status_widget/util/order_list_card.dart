import 'package:flutter/material.dart';

class OrderListCard extends StatelessWidget {

  final String imageOrderList;
  final String titleOrderList;
  final int quantity;
  final double priceOrderList;
  final String request;

  const OrderListCard({
    Key? key,
    required this.imageOrderList,
    required this.titleOrderList,
    required this.quantity,
    required this.priceOrderList,
    required this.request,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 65,
                height: 65,
                child: Image.asset(imageOrderList),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 150,
                child: Text(
                  titleOrderList,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF32324D),
                    fontFamily: "Mulish-Regular",
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${quantity.toInt()}",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFA5A5BA),
                  fontFamily: "Mulish-Regular",
                ),
              ),
              const SizedBox(width: 2),
              const Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                  " x ",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFC0C0CF),
                    fontFamily: "Mulish-Regular",
                  ),
                ),
              ),
              const SizedBox(width: 2),
              const Padding(
                padding: EdgeInsets.only(bottom: 5, right: 2),
                child: Text(
                  "\$", style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Mulish-Regular",
                    color: Color(0xFF8E8EA9)
                ),
                ),
              ),
              Text(
                priceOrderList.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF4A4A6A),
                  fontFamily: "Mulish-Regular",
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
