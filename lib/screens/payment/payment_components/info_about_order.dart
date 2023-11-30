import 'package:flutter/material.dart';
import 'package:Foodbox/features/provider/card_details_provider.dart';
import 'package:Foodbox/features/provider/email_controller_provider.dart';
import 'package:Foodbox/features/provider/order_total_provider.dart';
import 'package:Foodbox/screens/user_contact_details/tools/validator.dart';
import 'package:provider/provider.dart';


class InfoAboutOrder extends StatefulWidget {
  @override
  State<InfoAboutOrder> createState() => _InfoAboutOrderState();
}

class _InfoAboutOrderState extends State<InfoAboutOrder> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _tipsEditingController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  double total = 0.0;

  @override
  void dispose() {
    _textEditingController.dispose();
    _tipsEditingController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final emailProvider =
        Provider.of<EmailControllerProvider>(context, listen: false);
    emailController.text = emailProvider.email;
    super.initState();
  }

  bool isEmailValid = true;

  @override
  Widget build(BuildContext context) {
    final cardDetailsProvider = Provider.of<CardDetailsProvider>(context);
    return Container(
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
            orderTotalProvider.newSubTotal();
            final subTotal = orderTotalProvider.subTotal;
            total = itemsTotal +
                tax +
                (double.tryParse(_tipsEditingController.text) ?? 0.0);
            final totalWithTips = orderTotalProvider.totalWithTips;
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildRow(
                        "Items total", "\$", itemsTotal.toStringAsFixed(2)),
                    const SizedBox(height: 20),
                    buildRow("Tax", "\$", tax.toStringAsFixed(2)),
                    const SizedBox(height: 15),
                    buildDivider(),
                    const SizedBox(height: 15),
                    buildTextField(
                        emailController,
                        "Email for order information",
                        "assets/images/email_icon.png",
                        onChanged: (value) {
                      final emailProvider =
                          Provider.of<EmailControllerProvider>(context,
                              listen: false);
                      emailProvider.setEmail(value);
                      final isValid = Validator.validateEmail(value) == null;
                      setState(() {
                        isEmailValid = isValid;
                      });
                    },
                        border: isEmailValid
                            ? Border.all(
                                color: const Color(0xFFEAEAEF),
                                width: 1,
                              )
                            : Border.all(
                                color: Colors.red,
                                width: 1,
                              )),
                    const SizedBox(height: 15),
                    buildTextField(_tipsEditingController, "Add tips",
                        "assets/images/tips.png",
                        keyboardType: TextInputType.number, onChanged: (value) {
                      setState(() {
                        total =
                            itemsTotal + tax + (double.tryParse(value) ?? 0.0);
                      });
                      Provider.of<OrderTotalProvider>(context, listen: false)
                          .updateTips(double.tryParse(value) ?? 0.0);
                      Provider.of<OrderTotalProvider>(context, listen: false)
                          .newTotalPlusTips();
                    },
                        border: Border.all(
                          color: const Color(0xFFEAEAEF),
                          width: 1,
                        )),
                    const SizedBox(height: 15),
                    buildDivider(),
                    const SizedBox(height: 15),
                    if (cardDetailsProvider.showCardBanking)
                      buildRow("Subtotal", "\$", subTotal.toStringAsFixed(2)),
                    const SizedBox(height: 15),
                    buildRow("Total", "\$", totalWithTips.toStringAsFixed(2),
                        isTotal: true),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget buildRow(String title, String currencySymbol, String amount,
      {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w600,
            fontFamily: "Mulish-Regular",
            color: isTotal ? const Color(0xFF4A4A6A) : const Color(0xFF666687),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0, right: 2.0),
              child: Text(
                currencySymbol,
                style: TextStyle(
                  fontSize: isTotal ? 9 : 8,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Mulish-Regular",
                  color: isTotal
                      ? const Color(0xFFFFB080)
                      : const Color(0xFF8E8EA9),
                ),
              ),
            ),
            Text(
              amount,
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

  Widget buildDivider() {
    return Container(
      width: 320,
      height: 2,
      color: const Color(0xFFEAEAEF),
    );
  }

  Widget buildTextField(
    TextEditingController controller,
    String hintText,
    String prefixIconAsset, {
    TextInputType keyboardType = TextInputType.text,
    Function(String)? onChanged,
    Border? border,
  }) {
    return Container(
      width: 320,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: border,
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: FittedBox(
            fit: BoxFit.scaleDown,
            child: Image.asset(
              prefixIconAsset,
              width: 20,
              height: 20,
            ),
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
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          counterStyle: const TextStyle(
            fontSize: 13,
            color: Color(0xFFC0C0CF),
            fontFamily: "Mulish-Regular",
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
