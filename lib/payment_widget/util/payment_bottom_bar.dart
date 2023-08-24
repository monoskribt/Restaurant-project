import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/after_payment_widget/after_payment.dart';
import 'package:sushi_shop_project/order_status_widget/tools/order_total_provider.dart';

class PaymentBottomBar extends StatefulWidget {
  const PaymentBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentBottomBar> createState() => _PaymentBottomBarState();
}


class _PaymentBottomBarState extends State<PaymentBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderTotalProvider>(
      builder: (context, orderTotalProvider, _) {
        final totalWithTips = orderTotalProvider.totalWithTips;

        return Container(
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(26),
              topRight: Radius.circular(26),
            ),
            boxShadow: [
              // ...
            ],
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AfterPayment()),
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
                        "\$${totalWithTips.toStringAsFixed(2)}",
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
