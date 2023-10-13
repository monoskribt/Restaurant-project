import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/features/provider/order_provider.dart';
import 'package:sushi_shop_project/features/provider/order_total_provider.dart';
import 'package:sushi_shop_project/screens/payment_confirmation/payment_confirmation.dart';
import 'package:sushi_shop_project/services/smtp/send_email.dart';

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
        return buildBottomBar(totalWithTips);
      },
    );
  }

  Widget buildBottomBar(double totalWithTips) {
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
              MaterialPageRoute(
                  builder: (context) => const PaymentConfirmation()),
            );
          },
          child: buildPayButton(totalWithTips),
        )
    );
  }

  Widget buildPayButton(double totalWithTips) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            sendOrderEmail(totalWithTips);
          },
          child: Container(
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
        ),
      ],
    );
  }

  void sendOrderEmail(double totalWithTips) {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    final orderTotalProvider = Provider.of<OrderTotalProvider>(context, listen: false);
    final orderMap = orderProvider.orderMap;

    String emailMessage = 'Ordered Dishes:\n';
    for (var order in orderMap.values) {
      emailMessage +=
      'Dish: ${order.name}\n'
      'Quantity: ${order.quantity}\n'
      'Price: \$${order.price.toStringAsFixed(2)}\n'
      'Comment: ${order.comment}\n'
          '\n';
    }
    EmailService.sendEmail(
        recipientEmail: 'dmitrijmamilov@gmail.com',
        mailMessage: emailMessage,
      dishTips: orderTotalProvider.tips,
        dishPrice: totalWithTips,
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PaymentConfirmation()),
    );
  }
}