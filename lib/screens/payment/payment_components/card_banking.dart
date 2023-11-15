import 'package:flutter/material.dart';
import 'package:sushi_shop_project/models/card_details_model.dart';

import '../tools/format_card_number.dart';

class CardBanking extends StatelessWidget {
  final List<CardDetails> cardList;

  const CardBanking({Key? key, required this.cardList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = constraints.maxWidth * 1.1;
        double cardHeight = cardWidth * 0.45;

        return SizedBox(
          width: cardWidth,
          height: cardHeight,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.9),
            scrollDirection: Axis.horizontal,
            itemCount: cardList.length,
            itemBuilder: (context, index) {
              final cardDetails = cardList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: buildCard(cardDetails, cardWidth, cardHeight),
              );
            },
          ),
        );
      },
    );
  }

  Widget buildCardNumber(String cardNumber, double availableSpace) {
    final fontSize = availableSpace * 0.04;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          FormatCardNumber.format(cardNumber),
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            fontFamily: "Mulish-Regular",
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget buildCardDetails(String cardHolder, String expireDate, double availableSpace) {
    final fontSize = availableSpace * 0.04;
    const TextStyle style = TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: "Mulish-Regular",
      color: Color(0xFFDCDCE4),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              cardHolder,
              style: style.copyWith(fontSize: fontSize),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              expireDate,
              style: style.copyWith(fontSize: fontSize),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildCardContent(CardDetails cardDetails, double availableSpace) {
    return Column(
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
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: buildCardNumber(cardDetails.cardNumber, availableSpace),
          ),
        ),
        buildCardDetails(cardDetails.cardholderName, cardDetails.expireDate, availableSpace),
      ],
    );
  }


  Widget buildCard(CardDetails cardDetails, double cardWidth, double cardHeight) {
    final padding = EdgeInsets.all(cardWidth * 0.05);
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Container(
            width: cardWidth,
            height: cardHeight,
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xFF212134),
            ),
            child: buildCardContent(cardDetails, cardWidth),
          ),
          buildCircularImages(cardHeight),
        ],
      ),
    );
  }


  Widget buildCircularImages(double cardHeight) {
    return Stack(
      children: [
        Positioned(
          left: -22,
          top: -60,
          child: Image.asset(
            "assets/images/circular_card_banking.png",
            height: cardHeight * 1.45,
          ),
        ),
        Positioned(
          left: -40,
          top: 5,
          child: Image.asset(
            "assets/images/circular_card_banking_1.png",
            height: cardHeight * 0.75,
          ),
        ),
        Positioned(
          right: -39,
          bottom: -39,
          child: Image.asset(
            "assets/images/circular_card_banking_2.png",
            height: cardHeight * 0.85,
          ),
        ),
      ],
    );
  }
}
