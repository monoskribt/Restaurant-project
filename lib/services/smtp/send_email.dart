import 'package:flutter/foundation.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class EmailService {
  static Future<void> sendEmail({
    required String recipientEmail,
    required String mailMessage,
    String? dishName,
    double? dishPrice,
    double? dishTips,
    int? quantity,
  }) async {
    String username = 'dmitrijmamilov@gmail.com';
    String password = 'uiybbjfcxyjrpirj';
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'Mail Service')
      ..recipients.add(recipientEmail)
      ..subject = 'Mail '
      ..text =
          'Title: $mailMessage\n'
          'Tips: \$${dishTips?.toStringAsFixed(2) ?? 'Отсутствует значение'}\n'
          'Total price: \$${dishPrice?.toStringAsFixed(2) ?? 'Не указано'}';

    try {
      await send(message, smtpServer);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
