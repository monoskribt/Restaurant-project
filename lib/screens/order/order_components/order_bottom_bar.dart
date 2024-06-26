import 'package:flutter/material.dart';
import 'package:Foodbox/features/provider/order_provider.dart';
import 'package:Foodbox/features/provider/user_contact_details_provider.dart';
import 'package:Foodbox/screens/order/snackbar/snack_bar.dart';
import 'package:provider/provider.dart';


class OrderBottomBar extends StatelessWidget {
  const OrderBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double buttonWidth = constraints.maxWidth;
        double buttonHeight = constraints.maxHeight;
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
              final orderProvider =
              Provider.of<OrderProvider>(context, listen: false);
              final orderMap = orderProvider.orderMap;
              if (orderMap.isEmpty) {
                SnackBarBasket.showSnackBar(context);
              }
              else {
                Navigator.of(context).pushNamed('/order_status');
              }
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
                  child: buildOrderButton(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildOrderButton() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Checkout",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Mulish-Regular",
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        SizedBox(width: 5),
        Icon(
          Icons.arrow_forward_rounded,
          color: Colors.white,
        ),
      ],
    );
  }
}
