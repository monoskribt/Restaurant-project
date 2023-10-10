import 'package:flutter/material.dart';
import 'package:sushi_shop_project/models/card_details_model.dart';

import '../tools/format_card_number.dart';

class CardBanking extends StatelessWidget {
  final List<CardDetails> cardList;

  const CardBanking({Key? key, required this.cardList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        height: 190,
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.9),
          scrollDirection: Axis.horizontal,
          itemCount: cardList.length,
          itemBuilder: (context, index) {
            final cardDetails = cardList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: buildCard(cardDetails),
            );
          },
        ),
      ),
    );
  }

  Widget buildCard(CardDetails cardDetails) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Container(
            width: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xFF212134),
            ),
            child: buildCardContent(cardDetails),
          ),
          buildCircularImages(),
        ],
      ),
    );
  }

  Widget buildCardContent(CardDetails cardDetails) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              child: Image.asset(
                "assets/images/mastercard.png",
                width: 38,
                height: 24,
              ),
            ),
          ),
          const SizedBox(height: 35),
          buildCardNumber(cardDetails.cardNumber),
          const SizedBox(height: 35),
          buildCardDetails(cardDetails.cardholderName, cardDetails.expireDate),
        ],
      ),
    );
  }

  Widget buildCardNumber(String cardNumber) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          FormatCardNumber.format(cardNumber),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: "Mulish-Regular",
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget buildCardDetails(String cardHolder, String expireDate) {
    const TextStyle style = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: "Mulish-Regular",
      color: Color(0xFFDCDCE4),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          cardHolder,
          style: style,
        ),
        Text(
          expireDate,
          style: style,
        ),
      ],
    );
  }

  Widget buildCircularImages() {
    return Stack(
      children: [
        Positioned(
          left: -55,
          top: -110,
          child: Image.asset(
            "assets/images/circular_card_banking.png",
            height: 390,
          ),
        ),
        Positioned(
          left: -10,
          top: -5,
          child: Image.asset(
            "assets/images/circular_card_banking_1.png",
            height: 190,
          ),
        ),
        Positioned(
          right: -39,
          bottom: -39,
          child: Image.asset(
            "assets/images/circular_card_banking_2.png",
            height: 190,
          ),
        ),
      ],
    );
  }
}
