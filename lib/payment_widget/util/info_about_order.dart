import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/order_status_widget/tools/order_total_provider.dart';

class InfoAboutOrder extends StatefulWidget {
  @override
  State<InfoAboutOrder> createState() => _InfoAboutOrderState();
}

class _InfoAboutOrderState extends State<InfoAboutOrder> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _tipsEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 357,
      height: 300,
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
      child: Consumer<OrderTotalProvider>(
        builder: (context, orderTotalProvider, _) {
          final itemsTotal = orderTotalProvider.itemsTotal;
          final tax = orderTotalProvider.tax;
          final total = orderTotalProvider.total;
          return Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Items total",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Mulish-Regular",
                        color: Color(0xFF666687),
                      ),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 4.0, right: 2.0),
                          child: Text(
                            "\$",
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Mulish-Regular",
                              color: Color(0xFF8E8EA9),
                            ),
                          ),
                        ),
                        Text(
                          itemsTotal.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 15,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tax",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Mulish-Regular",
                        color: Color(0xFF666687),
                      ),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 4.0, right: 2.0),
                          child: Text(
                            "\$",
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Mulish-Regular",
                              color: Color(0xFF8E8EA9),
                            ),
                          ),
                        ),
                        Text(
                          tax.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 15,
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
                Container(width: 320, height: 2, color: const Color(0xFFEAEAEF)),
                const SizedBox(height: 15),
                Container(
                  width: 320,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFEAEAEF),
                      width: 1,
                    ),
                  ),
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Apply discount code',
                      prefixIcon: Image.asset(
                          "assets/images/procent.png", width: 20, height: 20,
                      ),
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        fontFamily: "Mulish-Regular",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF8E8EA9),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      counterStyle: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFFC0C0CF),
                        fontFamily: "Mulish-Regular",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: 320,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFEAEAEF),
                      width: 1,
                    ),
                  ),
                  child: TextField(
                    controller: _tipsEditingController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      final double tips = double.tryParse(value) ?? 0;
                      Provider.of<OrderTotalProvider>(context, listen: false).updateTips(tips);
                      updateTotal();
                    },
                    decoration: InputDecoration(
                      hintText: 'Add tips',
                      prefixIcon: Image.asset(
                        "assets/images/tips.png", width: 20, height: 20,
                      ),
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        fontFamily: "Mulish-Regular",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF8E8EA9),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      counterStyle: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFFC0C0CF),
                        fontFamily: "Mulish-Regular",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(width: 320, height: 2, color: const Color(0xFFEAEAEF)),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
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
                          padding: EdgeInsets.only(bottom: 4.0, right: 2.0),
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
              ],
            ),
          );
        },
      ),
    );
  }
  void updateTotal() {
    Provider.of<OrderTotalProvider>(context, listen: false).newTotalPlusTips();
  }
}
