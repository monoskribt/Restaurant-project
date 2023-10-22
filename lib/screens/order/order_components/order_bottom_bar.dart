import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/features/provider/order_provider.dart';
import 'package:sushi_shop_project/features/provider/user_contact_details_provider.dart';
import 'package:sushi_shop_project/screens/order/helpers/bottom_sheet_helper.dart';
import 'package:sushi_shop_project/screens/order/order_components/snack_bar.dart';
import 'package:sushi_shop_project/screens/order_status/order_status.dart';

class OrderBottomBar extends StatelessWidget {
  const OrderBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          final userContactProvider =
              Provider.of<UserContactDetailsProvider>(context, listen: false);
          if (orderMap.isNotEmpty) {
            if (userContactProvider.isContactInfoFinish) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OrderStatus()),
              );
            } else {
              BottomSheetHelper.showViewAContact(context);
            }
          } else {
            SnackBarBasket.showSnackBar(context);
          }
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
              child: buildOrderButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOrderButton() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Send order",
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
