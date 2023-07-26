import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/order_status_widget/tools/order_total_provider.dart';
import 'package:sushi_shop_project/payment_widget/payment.dart';

class OrderStatusBottomBar extends StatefulWidget {
  const OrderStatusBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderStatusBottomBar> createState() => _OrderStatusBottomBarState();
}

class _OrderStatusBottomBarState extends State<OrderStatusBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderTotalProvider>(
      builder: (context, orderTotalProvider, _) {
        final total = orderTotalProvider.total;

        return Container(
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(26),
              topRight: Radius.circular(26),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFDCDCE4),
                offset: Offset(0, -10),
                blurRadius: 20,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color(0x0C1A4B05),
                offset: Offset(0, 0),
                blurRadius: 5,
                spreadRadius: 0,
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Payment()),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 340,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xFF615793),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Pay",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Mulish-Regular",
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "\$${total.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Mulish-Regular",
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
