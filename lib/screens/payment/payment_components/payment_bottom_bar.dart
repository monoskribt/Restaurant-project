import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop_project/features/provider/email_controller_provider.dart';
import 'package:sushi_shop_project/features/provider/order_provider.dart';
import 'package:sushi_shop_project/features/provider/order_total_provider.dart';
import 'package:sushi_shop_project/features/provider/user_contact_details_provider.dart';
import 'package:sushi_shop_project/screens/payment/snackbar/snack_bar_error.dart';
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
    return LayoutBuilder(builder: (builder, constraints) {
      double buttonWidth = constraints.maxWidth;
      double buttonHeight = constraints.maxHeight;
      return Consumer<OrderTotalProvider>(
        builder: (context, orderTotalProvider, _) {
          final totalWithTips = orderTotalProvider.totalWithTips;
          final orderProvider =
              Provider.of<OrderProvider>(context, listen: false);
          final userContactDetailsProvider =
              Provider.of<UserContactDetailsProvider>(context, listen: false);
          final emailControllerProvider =
          Provider.of<EmailControllerProvider>(context, listen: false);
          return buildBottomBar(totalWithTips, buttonWidth, buttonHeight,
              orderProvider, userContactDetailsProvider, emailControllerProvider, orderTotalProvider);
        },
      );
    });
  }

  Widget buildBottomBar(
      double totalWithTips,
      double buttonWidth,
      double buttonHeight,
      OrderProvider orderProvider,
  UserContactDetailsProvider userContactDetailsProvider,
  EmailControllerProvider emailControllerProvider,
      OrderTotalProvider orderTotalProvider) {
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
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamedAndRemoveUntil('/payment_confirmation', (route) => false);
        },
        child: buildPayButton(totalWithTips, buttonWidth, buttonHeight,
            orderProvider, userContactDetailsProvider, emailControllerProvider, orderTotalProvider),
      ),
    );
  }

  Widget buildPayButton(
      double totalWithTips,
      double buttonWidth,
      double buttonHeight,
      OrderProvider orderProvider,
  UserContactDetailsProvider userContactDetailsProvider,
      EmailControllerProvider emailControllerProvider,
      OrderTotalProvider orderTotalProvider) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              final emailControllerProvider = Provider.of<EmailControllerProvider>(context, listen: false);

              if (emailControllerProvider.email.isNotEmpty && emailControllerProvider.validateEmail(emailControllerProvider.email)) {
                sendOrderEmail(totalWithTips);
                orderTotalProvider.clear();
                orderProvider.orderMap.clear();
                userContactDetailsProvider.clear();
                final emailProvider = Provider.of<EmailControllerProvider>(context, listen: false);
                emailProvider.setEmail('');
                Navigator.of(context).pushNamedAndRemoveUntil('/payment_confirmation', (route) => false);
                print("All clear");
              } else {
                SnackBarError.showSnackBar(context);
              }
            },
            child: Container(
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
    final orderTotalProvider =
        Provider.of<OrderTotalProvider>(context, listen: false);
    final userContactProvider =
        Provider.of<UserContactDetailsProvider>(context, listen: false);
    String emailController =
        Provider.of<EmailControllerProvider>(context, listen: false).email;

    final orderMap = orderProvider.orderMap;

    final contactDetails = userContactProvider.userContactDetails;

    String emailMessage = 'Ordered Dishes:\n';
    for (var order in orderMap.values) {
      emailMessage += 'Dish: ${order.name}\n'
          'Quantity: ${order.quantity}\n'
          'Price: \$${order.price.toStringAsFixed(2)}\n'
          'Comment: ${order.comment}\n'
          '\n';
    }

    String contactInfo = 'Contact Details:\n'
        'Name: ${contactDetails.name}\n'
        'Number: ${contactDetails.number}\n'
        'Address: ${contactDetails.address}\n\n';

    emailMessage = contactInfo + emailMessage;

    EmailService.sendEmail(
      recipientEmail: emailController,
      mailMessage: emailMessage,
      dishTips: orderTotalProvider.tips,
      dishPrice: totalWithTips,
    );
  }
}
