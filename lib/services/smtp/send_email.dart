import 'package:flutter/foundation.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class EmailService {
  static Future<void> sendEmail({
    required String recipientEmail,
    required String mailMessage,
    required String dishName,
    required double dishPrice,
    required int quantity,
  }) async {
    String username = 'dmitrijmamilov@gmail.com';
    String password = 'uiybbjfcxyjrpirj';
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'Mail Service')
      ..recipients.add(recipientEmail)
      ..subject = 'Mail '
      ..text = 'Блюдо: $dishName\nКоличество: $quantity\nЦена: \$${dishPrice.toStringAsFixed(2)}\nСообщение: $mailMessage';

    try {
      await send(message, smtpServer);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
