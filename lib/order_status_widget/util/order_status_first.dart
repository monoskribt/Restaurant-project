import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/order_status_widget/tools/order_time_provider.dart';

class OrderStatusFirst extends StatefulWidget {
  const OrderStatusFirst({
    Key? key,
    required this.orderTime,
  }) : super(key: key);

  final double orderTime;

  @override
  State<OrderStatusFirst> createState() => _OrderStatusFirstState();
}

class _OrderStatusFirstState extends State<OrderStatusFirst> {
  @override
  Widget build(BuildContext context) {
    final orderTimeProvider = Provider.of<OrderTimeProvider>(context);
    orderTimeProvider.orderTime = widget.orderTime;

    return Container(
      width: 357,
      height: 430,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3232470A),
            offset: Offset(0, 4),
            blurRadius: 20,
            spreadRadius: -2,
          ),
          BoxShadow(
            color: Color(0x0C1A4B08),
            offset: Offset(0, 0),
            blurRadius: 1,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          if (widget.orderTime >= orderTimeProvider.orderTimeEnd &&
              widget.orderTime < orderTimeProvider.orderTimeEnd + 1)
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your order is",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Mulish-Regular",
                        color: Color(0xFF8E8EA9),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "almost ready",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Mulish-Regular",
                        color: Color(0xFFFFB01D),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                SizedBox(
                  child: Image.asset(
                    orderTimeProvider.imageAsset,
                    width: 327,
                    height: 277,
                  ),
                ),
              ],
            )
          else if (widget.orderTime >= orderTimeProvider.orderTimeEnd + 1)
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your dishes are ready.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Mulish-Regular",
                        color: Color(0xFF8E8EA9),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Enjoy!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Mulish-Regular",
                        color: Color(0xFFFFB01D),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                SizedBox(
                  child: Image.asset(
                    orderTimeProvider.imageAsset,
                    width: 327,
                    height: 277,
                  ),
                ),
              ],
            )
          else
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your order will be ready in  ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Mulish-Regular",
                        color: Color(0xFF8E8EA9),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${widget.orderTime.toInt()} minutes",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Mulish-Regular",
                        color: Color(0xFFFFB01D),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                SizedBox(
                  child: Image.asset(
                    orderTimeProvider.imageAsset,
                    width: 327,
                    height: 277,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
