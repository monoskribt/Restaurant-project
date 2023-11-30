import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Foodbox/features/provider/email_controller_provider.dart';
import 'package:Foodbox/features/provider/user_contact_details_provider.dart';
import 'package:provider/provider.dart';


class BackArrowInfo {
  static void arrowBackInfo(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            title: Icon(CupertinoIcons.exclamationmark_circle,
                color: Colors.red, size: 0.05 * screenHeight),
            content: Text(
              "Are you sure you want to abort your data entry? "
                  "If you agree, the data already entered will not be saved.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 0.02 * screenHeight,
                fontFamily: "Mulish-Regular",
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 0.02 * screenHeight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        TextButton(
                          child: Text(
                            'No',
                            style: TextStyle(
                              fontSize: 0.02 * screenHeight,
                              fontFamily: "Mulish-Regular",
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFFFF7B2C),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              fontSize: 0.02 * screenHeight,
                              fontFamily: "Mulish-Regular",
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFFFF7B2C),
                            ),
                          ),
                          onPressed: () {
                            final userContactDetailsProvider =
                            Provider.of<UserContactDetailsProvider>(context, listen: false);
                            final emailControllerProvider =
                            Provider.of<EmailControllerProvider>(context, listen: false);
                            userContactDetailsProvider.clear();
                            emailControllerProvider.setEmail('');
                            Navigator.of(context)
                                .pushNamedAndRemoveUntil('/order_status', (route) => false);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}