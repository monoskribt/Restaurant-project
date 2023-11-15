import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/features/provider/order_total_provider.dart';
import 'package:sushi_shop_project/screens/full_menu/full_menu.dart';
import 'package:sushi_shop_project/screens/order_status/order_status_function/order_status_list.dart';

class OrderDropdown extends StatefulWidget {
  const OrderDropdown({
    Key? key,
  }) : super(key: key);

  @override
  _OrderDropdownState createState() => _OrderDropdownState();
}

class _OrderDropdownState extends State<OrderDropdown> {
  bool isExpanded = true;
  double itemsTotal = 0.0;
  double tax = 0.0;
  double total = 0.0;

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderTotalProvider>(
      builder: (context, orderTotalProvider, _) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            total = orderTotalProvider.total;
            itemsTotal = orderTotalProvider.itemsTotal;
            tax = orderTotalProvider.tax;
          });
        });
        return Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: Container(
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
            child: ExpansionTile(
              initiallyExpanded: isExpanded,
              onExpansionChanged: (expanded) {
                setState(() {
                  isExpanded = expanded;
                });
              },
              title: const Text(
                "Order list and prices",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Mulish-Regular",
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF8E8EA9),
                ),
              ),
              trailing: isExpanded
                  ? const Icon(Icons.expand_less, color: Color(0xFFFFB01D))
                  : const Icon(Icons.expand_more, color: Color(0xFFFFB01D)),
              children: [
                const OrderStatusList(),
                const SizedBox(height: 20),
                buildAddMoreFoodButton(context),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Container(
                      width: 320, height: 2, color: const Color(0xFFEAEAEF)),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Column(
                    children: [
                      buildTotalRow("Items Total", itemsTotal),
                      const SizedBox(height: 15),
                      buildTotalRow("Tax", tax),
                      const SizedBox(height: 20),
                      Container(
                          width: 320,
                          height: 2,
                          color: const Color(0xFFEAEAEF)),
                      const SizedBox(height: 20),
                      buildTotalRow("Total price", total, isTotal: true),
                      const SizedBox(height: 20),
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

  Widget buildTotalRow(String title, double value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w600,
            fontFamily: "Mulish-Regular",
            color: const Color(0xFF4A4A6A),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5, right: 2),
              child: Text(
                "\$",
                style: TextStyle(
                  fontSize: isTotal ? 10 : 8,
                  fontWeight: isTotal ? FontWeight.w800 : FontWeight.w700,
                  fontFamily: "Mulish-Regular",
                  color: isTotal
                      ? const Color(0xFFFF7B2C)
                      : const Color(0xFF4A4A6A),
                ),
              ),
            ),
            Text(
              value.toStringAsFixed(2),
              style: TextStyle(
                fontSize: isTotal ? 16 : 14,
                fontWeight: isTotal ? FontWeight.w800 : FontWeight.w700,
                fontFamily: "Mulish-Regular",
                color:
                    isTotal ? const Color(0xFFFF7B2C) : const Color(0xFF4A4A6A),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildAddMoreFoodButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/');
      },
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.add,
                size: 20,
                color: Color(0xFFFFB01D),
              ),
            ),
            Text(
              "Add more food to order",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFFB01D),
                fontFamily: "Mulish-Regular",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
