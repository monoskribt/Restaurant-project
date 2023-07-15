import 'package:flutter/material.dart';
import 'package:sushi_shop_project/payment_widget/tools/card_details.dart';

import '../tools/format_card_number.dart';

class CardBanking extends StatelessWidget {
  final CardDetails cardDetails;

  const CardBanking({Key? key, required this.cardDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        width: 320,
        height: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFF212134),
        ),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  child: Image.asset("assets/images/mastercard.png",
                      width: 38, height: 24),
                ),
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    FormatCardNumber.format(cardDetails.cardNumber),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Mulish-Regular",
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        cardDetails.cardholderName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Mulish-Regular",
                          color: Color(0xFFDCDCE4),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        cardDetails.expireDate,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Mulish-Regular",
                          color: Color(0xFFDCDCE4),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
