import 'package:flutter/cupertino.dart';
import 'package:Foodbox/features/provider/order_provider.dart';
import 'package:Foodbox/features/provider/order_total_provider.dart';
import 'package:Foodbox/features/provider/user_contact_details_provider.dart';
import 'package:Foodbox/services/smtp/send_email.dart';
import 'package:provider/provider.dart';


class SendOrderEmail {
  static void sendOrderEmail(double totalWithTips, BuildContext context, String recipientEmail) {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    final orderTotalProvider = Provider.of<OrderTotalProvider>(context, listen: false);
    final userContactProvider = Provider.of<UserContactDetailsProvider>(context, listen: false);

    final orderMap = orderProvider.orderMap;
    final contactList = userContactProvider.userContactDetailsList;

    String emailMessage = 'Ordered Dishes:\n';
    for (var order in orderMap.values) {
      emailMessage += 'Dish: ${order.name}\n'
          'Quantity: ${order.quantity}\n'
          'Price: \$${order.price.toStringAsFixed(2)}\n'
          'Comment: ${order.comment}\n'
          '\n';
    }

    for(var contactDetails in contactList) {
      String contactInfo = 'Contact Details:\n'
          'Name: ${contactDetails.name}\n'
          'Number: ${contactDetails.number}\n'
          'Address: ${contactDetails.address}\n\n';

      emailMessage = contactInfo + emailMessage;
    }

    EmailService.sendEmail(
      recipientEmail: recipientEmail,
      mailMessage: emailMessage,
      dishTips: orderTotalProvider.tips,
      dishPrice: totalWithTips,
    );
  }
}
