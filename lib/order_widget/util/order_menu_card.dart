import 'package:flutter/material.dart';
import 'package:sushi_shop_project/order_widget/tools/cart_counter_order.dart';

class OrderCard extends StatelessWidget {

  final String imageOrder;
  final String nameOrder;
  final double ratingOrder;
  final dynamic reviewOrder;
  final double priceOrder;


  const OrderCard({
    Key? key,
    required this.imageOrder,
    required this.nameOrder,
    required this.ratingOrder,
    required this.reviewOrder,
    required this.priceOrder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x32324705),
            offset: Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 4,
          ),
          BoxShadow(
            color: Color(0x0C1A4B0D),
            offset: Offset(0, 0),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: SizedBox(
        width: 360,
        child: Row(
          children: [
            SizedBox(
              width: 120,
              child: Image.asset(
                imageOrder,
                width: 140,
                height: 140,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 1.0, bottom: 10.0, top: 10.0),
                        child: Row(
                          children: [
                            Text(
                              nameOrder,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: "Mulish-Regular",
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF32324D),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: SizedBox(
                              width: 15,
                              height: 15,
                              child: Image.asset("assets/images/star_1.2.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Text(
                              ratingOrder.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: "Mulish-Regular",
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF8E8EA9),
                              ),
                            ),
                          ),
                          Text(
                            '(${reviewOrder.toString()} reviews)',
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: "Mulish-Regular",
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFC0C0CF),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 3.0),
                        child: Text(
                          "\$",
                          style: TextStyle(
                            fontSize: 8,
                            fontFamily: "Mulish-Regular",
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFFB080),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        priceOrder.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: "Mulish-Regular",
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFF7B2C),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
             CartCounterOrder(),
          ],
        ),
      ),
    );
  }
}
