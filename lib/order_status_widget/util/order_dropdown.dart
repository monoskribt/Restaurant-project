import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/full_menu_widget/full_menu.dart';
import 'package:sushi_shop_project/order_status_widget/function/order_list_body.dart';
import 'package:sushi_shop_project/order_status_widget/tools/order_total_provider.dart';
import 'package:sushi_shop_project/order_status_widget/util/order_list_card.dart';

class OrderDropdown extends StatefulWidget {
  const OrderDropdown({
    Key? key,
  }) : super(key: key);

  @override
  _OrderDropdownState createState() => _OrderDropdownState();
}

class _OrderDropdownState extends State<OrderDropdown> {
  double tax = 0.0;
  bool isExpanded = false;



  void calculateTax() {
    final orderTotalProvider = Provider.of<OrderTotalProvider>(context, listen: false);
    final itemsTotal = orderTotalProvider.itemsTotal;
    final tax = itemsTotal * 0.1;
    orderTotalProvider.updateTax(tax);
    orderTotalProvider.updateTotal();
  }



  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    calculateTax();

  }


  @override
  Widget build(BuildContext context) {
    return Consumer<OrderTotalProvider>(
      builder: (context, orderTotalProvider, _) {
        final itemsTotal = orderTotalProvider.itemsTotal;
        final tax = orderTotalProvider.tax;
        final total = orderTotalProvider.total;
        calculateTax();
        return Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: Container(
            width: 355,
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
                const OrderListBody(),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FullMenu()),
                    );
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
                ),
                const SizedBox(height: 30),
                Container(width: 320, height: 2, color: const Color(0xFFEAEAEF)),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Items Total",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Mulish-Regular",
                              color: Color(0xFF666687),
                            ),
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 5, right: 2),
                                child: Text(
                                  "\$",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Mulish-Regular",
                                    color: Color(0xFF8E8EA9),
                                  ),
                                ),
                              ),
                              Text(
                                itemsTotal.toStringAsFixed(2),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Mulish-Regular",
                                  color: Color(0xFF4A4A6A),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Tax",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Mulish-Regular",
                              color: Color(0xFF666687),
                            ),
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 5, right: 2),
                                child: Text(
                                  "\$",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Mulish-Regular",
                                    color: Color(0xFF8E8EA9),
                                  ),
                                ),
                              ),
                              Text(
                                tax.toStringAsFixed(2),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Mulish-Regular",
                                  color: Color(0xFF4A4A6A),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(width: 320, height: 2, color: const Color(0xFFEAEAEF)),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total price",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Mulish-Regular",
                              color: Color(0xFF4A4A6A),
                            ),
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 5, right: 2),
                                child: Text(
                                  "\$",
                                  style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Mulish-Regular",
                                    color: Color(0xFFFFB080),
                                  ),
                                ),
                              ),
                              Text(
                                total.toStringAsFixed(2),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "Mulish-Regular",
                                  color: Color(0xFFFF7B2C),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
}