import 'package:flutter/material.dart';
import 'package:Foodbox/features/provider/order_total_provider.dart';
import 'package:provider/provider.dart';


class OrderStatusBottomBar extends StatefulWidget {
  const OrderStatusBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderStatusBottomBar> createState() => _OrderStatusBottomBarState();
}

class _OrderStatusBottomBarState extends State<OrderStatusBottomBar> {
  double total = 0.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (builder, constraints) {
        double buttonWidth = constraints.maxWidth;
        double buttonHeight = constraints.maxHeight;
        return Consumer<OrderTotalProvider>(
          builder: (context, orderTotalProvider, _) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                total = orderTotalProvider.total;
              });
            });
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
                  Navigator.of(context).pushNamed('/user_contact');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: buttonWidth / 1.3,
                      height: buttonHeight / 14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xFF615793),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Order",
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
      },
    );
  }
}
